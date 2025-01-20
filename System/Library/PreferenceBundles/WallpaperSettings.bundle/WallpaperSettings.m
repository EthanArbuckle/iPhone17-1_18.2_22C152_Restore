uint64_t sub_2AD8(uint64_t a1)
{
  uint64_t vars8;

  qword_49130 = [*(id *)(a1 + 32) createWorkloopWithLabel:@"com.apple.WallpaperSettings.framework-workloop"];

  return _objc_release_x1();
}

uint64_t variable initialization expression of WallpaperSettingsRootViewController.handlingCustomizeSelection()
{
  return 0;
}

uint64_t variable initialization expression of WallpaperSettingsRootViewController.didResignActiveNotificationHandle()
{
  return 0;
}

uint64_t variable initialization expression of WallpaperSettingsRootViewController.autobahnViewModel()
{
  return sub_199C8();
}

void sub_2BB8()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v1 = (void *)Strong;
    sub_52F0();
  }
}

void sub_2C0C(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v5 = (void *)Strong;
    sub_2C7C(a1, a2);
  }
}

void sub_2C7C(uint64_t a1, void *a2)
{
  if (v2[OBJC_IVAR___WallpaperSettingsRootViewController_handlingCustomizeSelection])
  {
    if (qword_451B8 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_32A10();
    sub_6CA4(v3, (uint64_t)qword_466E8);
    oslog = sub_329F0();
    os_log_type_t v4 = sub_338E0();
    if (os_log_type_enabled(oslog, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_0, oslog, v4, "handleDidTapOnPosterPreview... already handling a customize selection, doing nothing", v5, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    v2[OBJC_IVAR___WallpaperSettingsRootViewController_handlingCustomizeSelection] = 1;
    if (qword_48338 != -1) {
      swift_once();
    }
    v8 = (void *)qword_4A3D8;
    v9 = (void *)swift_allocObject();
    v9[2] = a2;
    v9[3] = v2;
    v9[4] = a1;
    aBlock[4] = sub_6C98;
    aBlock[5] = v9;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_50DC;
    aBlock[3] = &unk_42250;
    v10 = _Block_copy(aBlock);
    id v11 = a2;
    v12 = v2;
    swift_release();
    [v8 fetchPosterConfigurationsForRole:0 completion:v10];
    _Block_release(v10);
  }
}

id sub_2E98()
{
  uint64_t v1 = OBJC_IVAR___WallpaperSettingsRootViewController____lazy_storage___hostingController;
  v2 = *(void **)(v0 + OBJC_IVAR___WallpaperSettingsRootViewController____lazy_storage___hostingController);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR___WallpaperSettingsRootViewController____lazy_storage___hostingController);
  }
  else
  {
    os_log_type_t v4 = (void *)sub_2EFC();
    v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_2EFC()
{
  uint64_t v0 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v1 = swift_allocObject();
  swift_unknownObjectWeakInit();
  type metadata accessor for WallpaperAutobahnViewModel();
  sub_6C10((unint64_t *)&qword_45280, (void (*)(uint64_t))type metadata accessor for WallpaperAutobahnViewModel);
  swift_retain_n();
  swift_retain();
  swift_retain();
  sub_32C30();
  type metadata accessor for PosterConfigurationCarouselViewModel();
  swift_allocObject();
  swift_retain();
  swift_retain();
  sub_1AFE8((uint64_t)sub_6C00, v0, (uint64_t)sub_6C08, v1);
  swift_release();
  swift_release();
  swift_release();
  id v2 = objc_allocWithZone((Class)sub_5CC8(&qword_45288));
  return sub_32FD0();
}

Swift::Void __swiftcall WallpaperSettingsRootViewController.viewDidLoad()()
{
  v16.receiver = v0;
  v16.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v16, "viewDidLoad");
  if (qword_48330 != -1) {
    swift_once();
  }
  id v1 = (id)qword_4A3D0;
  NSString v2 = sub_336D0();
  NSString v3 = [v1 localizedStringForKey:v2 value:0 table:0];

  if (!v3)
  {
    sub_336E0();
    NSString v3 = sub_336D0();
    swift_bridgeObjectRelease();
  }
  [v0 setTitle:v3];

  id v4 = sub_2E98();
  id v5 = [v4 view];

  if (v5)
  {
    id v6 = [v0 view];
    if (v6)
    {
      v7 = v6;
      [v6 addSubview:v5];

      id v8 = [v0 view];
      if (v8)
      {
        v9 = v8;
        [v8 bounds];
        double v11 = v10;
        double v13 = v12;

        objc_msgSend(v5, "setFrame:", 0.0, 0.0, v11, v13);
        [v5 setAutoresizingMask:18];
        id v14 = sub_2E98();
        [v0 addChildViewController:v14];

        id v15 = sub_2E98();
        [v15 didMoveToParentViewController:v0];

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

Swift::Void __swiftcall WallpaperSettingsRootViewController.viewIsAppearing(_:)(Swift::Bool a1)
{
  v3.receiver = v1;
  v3.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v3, "viewIsAppearing:", a1);
  sub_3368();
}

uint64_t sub_3368()
{
  id v1 = [v0 viewIfLoaded];
  double v2 = 1.0;
  double v3 = 2.0;
  if (v1)
  {
    id v4 = v1;
    id v5 = [v1 window];

    if (v5)
    {
      [v5 bounds];
      double v2 = v6;
      double v3 = v7;
    }
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  uint64_t result = sub_32A80();
  v9 = (void *)UIApp;
  if (UIApp)
  {
    swift_retain();
    objc_msgSend(v9, "activeInterfaceOrientation", *(void *)&v2, *(void *)&v3);
    swift_getKeyPath();
    swift_getKeyPath();
    return sub_32A80();
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall WallpaperSettingsRootViewController.viewDidAppear(_:)(Swift::Bool a1)
{
  double v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v32 = sub_32910();
  uint64_t v5 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  double v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_5CC8(&qword_48368);
  __chkstk_darwin(v8 - 8);
  double v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_328B0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  id v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v17 = (char *)&v32 - v16;
  id v33 = v2;
  v34.receiver = v2;
  v34.super_class = ObjectType;
  objc_msgSendSuper2(&v34, "viewDidAppear:", a1);
  sub_328A0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_6D44((uint64_t)v10, &qword_48368);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v17, v10, v11);
    sub_32900();
    if (qword_48330 != -1) {
      swift_once();
    }
    id v18 = objc_msgSend((id)qword_4A3D0, "bundleURL", v32);
    sub_32890();

    id v19 = objc_allocWithZone((Class)_NSLocalizedStringResource);
    NSString v20 = sub_336D0();
    Class isa = sub_328F0().super.isa;
    sub_32880(v22);
    v24 = v23;
    id v25 = [v19 initWithKey:v20 table:0 locale:isa bundleURL:v23];

    v26 = *(void (**)(char *, uint64_t))(v12 + 8);
    v26(v15, v11);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v32);
    NSString v27 = sub_336D0();
    sub_70C4(0, &qword_451C0);
    Class v28 = sub_33750().super.isa;
    sub_32880(v29);
    v31 = v30;
    objc_msgSend(v33, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", v27, v25, v28, v30);

    v26(v17, v11);
  }
}

void WallpaperSettingsRootViewController.viewWillTransition(to:with:)(void *a1, double a2, double a3)
{
  v17.receiver = v3;
  v17.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v17, "viewWillTransitionToSize:withTransitionCoordinator:", a1, a2, a3);
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v15 = sub_5D44;
  uint64_t v16 = v7;
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 1107296256;
  uint64_t v13 = sub_3B18;
  uint64_t v14 = &unk_41FD8;
  uint64_t v8 = _Block_copy(&v11);
  swift_release();
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v15 = sub_5D44;
  uint64_t v16 = v9;
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 1107296256;
  uint64_t v13 = sub_3B18;
  uint64_t v14 = &unk_42000;
  double v10 = _Block_copy(&v11);
  swift_release();
  [a1 animateAlongsideTransition:v8 completion:v10];
  _Block_release(v10);
  _Block_release(v8);
}

uint64_t sub_3B18(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_3B78()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = (void *)Strong;
    sub_3368();
  }
}

id WallpaperSettingsRootViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    NSString v6 = sub_336D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithNibName:v6 bundle:a3];

  return v7;
}

id WallpaperSettingsRootViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  ObjectType = (objc_class *)swift_getObjectType();
  v3[OBJC_IVAR___WallpaperSettingsRootViewController_handlingCustomizeSelection] = 0;
  *(void *)&v3[OBJC_IVAR___WallpaperSettingsRootViewController_activeCoordinator] = 0;
  uint64_t v7 = OBJC_IVAR___WallpaperSettingsRootViewController_autobahnViewModel;
  type metadata accessor for WallpaperAutobahnViewModel();
  swift_allocObject();
  uint64_t v8 = v3;
  *(void *)&v3[v7] = sub_199C8();
  *(void *)&v8[OBJC_IVAR___WallpaperSettingsRootViewController____lazy_storage___hostingController] = 0;
  *(void *)&v8[OBJC_IVAR___WallpaperSettingsRootViewController_didResignActiveNotificationHandle] = 0;

  if (a2)
  {
    NSString v9 = sub_336D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v9 = 0;
  }
  v12.receiver = v8;
  v12.super_class = ObjectType;
  id v10 = objc_msgSendSuper2(&v12, "initWithNibName:bundle:", v9, a3);

  return v10;
}

id WallpaperSettingsRootViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id WallpaperSettingsRootViewController.init(coder:)(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  v1[OBJC_IVAR___WallpaperSettingsRootViewController_handlingCustomizeSelection] = 0;
  *(void *)&v1[OBJC_IVAR___WallpaperSettingsRootViewController_activeCoordinator] = 0;
  uint64_t v4 = OBJC_IVAR___WallpaperSettingsRootViewController_autobahnViewModel;
  type metadata accessor for WallpaperAutobahnViewModel();
  swift_allocObject();
  uint64_t v5 = v1;
  *(void *)&v1[v4] = sub_199C8();
  *(void *)&v5[OBJC_IVAR___WallpaperSettingsRootViewController____lazy_storage___hostingController] = 0;
  *(void *)&v5[OBJC_IVAR___WallpaperSettingsRootViewController_didResignActiveNotificationHandle] = 0;

  v8.receiver = v5;
  v8.super_class = ObjectType;
  id v6 = objc_msgSendSuper2(&v8, "initWithCoder:", a1);

  return v6;
}

id WallpaperSettingsRootViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_4010(unint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v91 = a5;
  v94 = a4;
  id v106 = a3;
  unint64_t v108 = a1;
  uint64_t v97 = sub_33630();
  uint64_t v93 = *(void *)(v97 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v7 = (char *)&v88 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_33660();
  uint64_t v95 = *(void *)(v8 - 8);
  ((void (*)(void))__chkstk_darwin)();
  id v10 = (char *)&v88 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_328E0();
  os_log_t v110 = *(os_log_t *)(v11 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v13 = (char *)&v88 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_5CC8(&qword_45290);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v16 = (char *)&v88 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5CC8((uint64_t *)&unk_48440);
  uint64_t v17 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v18 = __chkstk_darwin(v17);
  NSString v20 = (char *)&v88 - v19;
  __chkstk_darwin(v18);
  v23 = (char *)&v88 - v22;
  if (a2)
  {
    if (qword_451B8 != -1) {
LABEL_45:
    }
      swift_once();
    uint64_t v24 = sub_32A10();
    sub_6CA4(v24, (uint64_t)qword_466E8);
    swift_errorRetain();
    swift_errorRetain();
    os_log_t v110 = (os_log_t)sub_329F0();
    os_log_type_t v25 = sub_338F0();
    if (os_log_type_enabled(v110, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      NSString v27 = (void *)swift_slowAlloc();
      *(_DWORD *)v26 = 138412290;
      swift_errorRetain();
      uint64_t v28 = _swift_stdlib_bridgeErrorToNSError();
      aBlock = (void **)v28;
      sub_33A30();
      *NSString v27 = v28;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v110, v25, "handleDidTapOnPosterPreview... error fetching configurations to match on for editing, bailing. Error: %@", v26, 0xCu);
      sub_5CC8(&qword_483A8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      os_log_t v56 = v110;
    }
    return;
  }
  v29 = v110;
  uint64_t v90 = v8;
  uint64_t v101 = v21;
  uint64_t v30 = v97;
  uint64_t v105 = v14;
  v96 = v13;
  v88 = v10;
  v89 = v7;
  unint64_t v31 = v108;
  if (v108 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_33B70();
  }
  else
  {
    uint64_t v32 = *(void *)((char *)&dword_10 + (v108 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
  }
  uint64_t v33 = v30;
  uint64_t v34 = v90;
  uint64_t v102 = v32;
  if (!v32)
  {
    swift_bridgeObjectRelease();
    uint64_t v57 = v93;
LABEL_33:
    uint64_t v58 = v95;
    v59 = v89;
    v60 = v94;
    if (qword_451B8 != -1) {
      swift_once();
    }
    uint64_t v61 = sub_32A10();
    sub_6CA4(v61, (uint64_t)qword_466E8);
    v62 = sub_329F0();
    os_log_type_t v63 = sub_338F0();
    if (os_log_type_enabled(v62, v63))
    {
      v64 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v64 = 0;
      _os_log_impl(&dword_0, v62, v63, "handleDidTapOnPosterPreview... did not find a true matching configuration for the tapped configuration, doing nothing", v64, 2u);
      swift_slowDealloc();
    }

    sub_70C4(0, (unint64_t *)&qword_48388);
    v65 = (void *)sub_33940();
    uint64_t v66 = swift_allocObject();
    *(void *)(v66 + 16) = v60;
    v115 = sub_6DD8;
    v116 = (void *)v66;
    aBlock = _NSConcreteStackBlock;
    uint64_t v112 = 1107296256;
    v113 = sub_5098;
    v114 = &unk_422A0;
    v67 = _Block_copy(&aBlock);
    id v68 = v60;
    swift_release();
    v69 = v88;
    sub_33640();
    aBlock = (void **)&_swiftEmptyArrayStorage;
    sub_6C10(&qword_48390, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_5CC8(&qword_48398);
    sub_6DEC();
    sub_33A50();
    sub_33950();
    _Block_release(v67);

    (*(void (**)(char *, uint64_t))(v57 + 8))(v59, v33);
    (*(void (**)(char *, uint64_t))(v58 + 8))(v69, v34);
    return;
  }
  unint64_t v104 = v31 & 0xC000000000000001;
  os_log_t v110 = v29 + 7;
  v35 = v29 + 6;
  v92 = v29 + 4;
  v99 = (void (**)(uint64_t, uint64_t))&v29[1];
  v100 = v23;
  uint64_t v36 = 4;
  v37 = &PosterBoardUICoordinator;
  uint64_t v38 = v102;
  uint64_t v107 = v11;
  v103 = (unsigned int (**)(char *, uint64_t, uint64_t))v35;
  while (1)
  {
    uint64_t v40 = v36 - 4;
    if (v104)
    {
      id v41 = (id)sub_33AB0();
      uint64_t v42 = v36 - 3;
      if (__OFADD__(v40, 1)) {
        goto LABEL_44;
      }
    }
    else
    {
      id v41 = *(id *)(v31 + 8 * v36);
      uint64_t v42 = v36 - 3;
      if (__OFADD__(v40, 1))
      {
LABEL_44:
        __break(1u);
        goto LABEL_45;
      }
    }
    count = (const char *)v37[418].count;
    id v109 = v41;
    id v44 = objc_msgSend(v41, count, v88);
    if (v44)
    {
      v45 = v44;
      sub_328D0();

      Class isa = v110->isa;
      ((void (*)(char *, void, uint64_t, uint64_t))v110->isa)(v23, 0, 1, v11);
    }
    else
    {
      Class isa = v110->isa;
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v110->isa)(v23, 1, 1, v11);
    }
    id v47 = [v106 (SEL)v37[418].count];
    if (v47)
    {
      v48 = v47;
      sub_328D0();

      uint64_t v49 = 0;
    }
    else
    {
      uint64_t v49 = 1;
    }
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))isa)(v20, v49, 1, v11);
    uint64_t v50 = (uint64_t)&v16[*(int *)(v105 + 48)];
    sub_6CDC((uint64_t)v23, (uint64_t)v16);
    sub_6CDC((uint64_t)v20, v50);
    v51 = *v103;
    if ((*v103)(v16, 1, v11) == 1) {
      break;
    }
    uint64_t v52 = v101;
    sub_6CDC((uint64_t)v16, v101);
    if (v51((char *)v50, 1, v11) == 1)
    {
      sub_6D44((uint64_t)v20, (uint64_t *)&unk_48440);
      v23 = v100;
      sub_6D44((uint64_t)v100, (uint64_t *)&unk_48440);
      (*v99)(v52, v11);
      uint64_t v38 = v102;
      v37 = &PosterBoardUICoordinator;
      goto LABEL_10;
    }
    v53 = v96;
    ((void (*)(char *, uint64_t, uint64_t))v92->isa)(v96, v50, v11);
    sub_6C10(&qword_45298, (void (*)(uint64_t))&type metadata accessor for UUID);
    int v54 = sub_336C0();
    uint64_t v11 = v107;
    int v98 = v54;
    v55 = *v99;
    (*v99)((uint64_t)v53, v107);
    sub_6D44((uint64_t)v20, (uint64_t *)&unk_48440);
    v23 = v100;
    sub_6D44((uint64_t)v100, (uint64_t *)&unk_48440);
    v55(v52, v11);
    sub_6D44((uint64_t)v16, (uint64_t *)&unk_48440);
    uint64_t v38 = v102;
    v37 = &PosterBoardUICoordinator;
    if (v98) {
      goto LABEL_39;
    }
LABEL_11:

    ++v36;
    BOOL v39 = v42 == v38;
    unint64_t v31 = v108;
    if (v39)
    {
      swift_bridgeObjectRelease();
      uint64_t v33 = v97;
      uint64_t v57 = v93;
      uint64_t v34 = v90;
      goto LABEL_33;
    }
  }
  sub_6D44((uint64_t)v20, (uint64_t *)&unk_48440);
  uint64_t v11 = v107;
  sub_6D44((uint64_t)v23, (uint64_t *)&unk_48440);
  v37 = &PosterBoardUICoordinator;
  if (v51((char *)v50, 1, v11) != 1)
  {
LABEL_10:
    sub_6D44((uint64_t)v16, &qword_45290);
    goto LABEL_11;
  }
  sub_6D44((uint64_t)v16, (uint64_t *)&unk_48440);
LABEL_39:
  swift_bridgeObjectRelease();
  if (qword_451B8 != -1) {
    swift_once();
  }
  uint64_t v70 = sub_32A10();
  sub_6CA4(v70, (uint64_t)qword_466E8);
  v71 = sub_329F0();
  os_log_type_t v72 = sub_338E0();
  BOOL v73 = os_log_type_enabled(v71, v72);
  uint64_t v74 = v97;
  uint64_t v75 = v93;
  uint64_t v76 = v90;
  v77 = v88;
  v78 = v94;
  uint64_t v79 = v91;
  if (v73)
  {
    v80 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v80 = 0;
    _os_log_impl(&dword_0, v71, v72, "handleDidTapOnPosterPreview... found matching configuration, beginning editing", v80, 2u);
    swift_slowDealloc();
  }

  sub_70C4(0, (unint64_t *)&qword_48388);
  v81 = (void *)sub_33940();
  v82 = (void *)swift_allocObject();
  v82[2] = v78;
  v82[3] = v79;
  id v83 = v109;
  v82[4] = v109;
  v115 = sub_6ED0;
  v116 = v82;
  aBlock = _NSConcreteStackBlock;
  uint64_t v112 = 1107296256;
  v113 = sub_5098;
  v114 = &unk_422F0;
  v84 = _Block_copy(&aBlock);
  id v85 = v78;
  id v86 = v83;
  swift_release();
  sub_33640();
  aBlock = (void **)&_swiftEmptyArrayStorage;
  sub_6C10(&qword_48390, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_5CC8(&qword_48398);
  sub_6DEC();
  v87 = v89;
  sub_33A50();
  sub_33950();
  _Block_release(v84);

  (*(void (**)(char *, uint64_t))(v75 + 8))(v87, v74);
  (*(void (**)(char *, uint64_t))(v95 + 8))(v77, v76);
}

void sub_4D80(uint64_t a1, void *a2)
{
  id v3 = v2;
  id v6 = [v3 view];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = [v6 window];

    if (v8)
    {
      id v22 = [v8 windowScene];

      if (v22)
      {
        uint64_t v9 = OBJC_IVAR___WallpaperSettingsRootViewController_activeCoordinator;
        if (*(void *)&v3[OBJC_IVAR___WallpaperSettingsRootViewController_activeCoordinator])
        {
        }
        else
        {
          objc_allocWithZone((Class)type metadata accessor for PosterBoardUICoordinator());
          id v10 = a2;
          id v11 = v22;
          uint64_t v12 = (char *)sub_8F5C(v11, a1, a2);
          *(void *)&v12[OBJC_IVAR____TtC17WallpaperSettings24PosterBoardUICoordinator_delegate + 8] = &off_42028;
          swift_unknownObjectWeakAssign();
          uint64_t v13 = *(void **)&v3[v9];
          *(void *)&v3[v9] = v12;
          uint64_t v14 = v12;

          BOOL v15 = *(void *)&v3[v9] != 0;
          swift_getKeyPath();
          swift_getKeyPath();
          LOBYTE(aBlock[0]) = v15;
          swift_retain();
          sub_32A80();

          sub_8DD8();
          uint64_t v16 = OBJC_IVAR___WallpaperSettingsRootViewController_didResignActiveNotificationHandle;
          if (*(void *)&v3[OBJC_IVAR___WallpaperSettingsRootViewController_didResignActiveNotificationHandle])
          {
          }
          else
          {
            id v17 = [self defaultCenter];
            id v18 = [self sharedApplication];
            id v19 = [self mainQueue];
            aBlock[4] = sub_518C;
            aBlock[5] = 0;
            aBlock[0] = _NSConcreteStackBlock;
            aBlock[1] = 1107296256;
            aBlock[2] = sub_51FC;
            aBlock[3] = &unk_42318;
            NSString v20 = _Block_copy(aBlock);
            id v21 = [v17 addObserverForName:UIApplicationWillResignActiveNotification object:v18 queue:v19 usingBlock:v20];

            _Block_release(v20);
            *(void *)&v3[v16] = v21;
            swift_unknownObjectRelease();
          }
        }
      }
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_5098(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_50DC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  sub_70C4(0, (unint64_t *)&qword_48380);
  uint64_t v5 = sub_33760();
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();
  swift_bridgeObjectRelease();
}

void sub_518C()
{
  id v0 = [self defaultCenter];
  [v0 postNotificationName:NSExtensionHostWillResignActiveNotification object:0];
}

uint64_t sub_51FC(uint64_t a1)
{
  uint64_t v2 = sub_32820();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = *(void (**)(char *))(a1 + 32);
  sub_32810();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_52F0()
{
  id v1 = v0;
  id v2 = [v0 view];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = [v2 window];

    if (v4)
    {
      id v11 = [v4 windowScene];

      if (v11)
      {
        uint64_t v5 = OBJC_IVAR___WallpaperSettingsRootViewController_activeCoordinator;
        if (*(void *)&v1[OBJC_IVAR___WallpaperSettingsRootViewController_activeCoordinator])
        {
        }
        else
        {
          id v6 = objc_allocWithZone((Class)type metadata accessor for PosterBoardUICoordinator());
          id v7 = v11;
          uint64_t v8 = (char *)sub_8F5C(v7, 0, 0);
          *(void *)&v8[OBJC_IVAR____TtC17WallpaperSettings24PosterBoardUICoordinator_delegate + 8] = &off_42028;
          swift_unknownObjectWeakAssign();
          uint64_t v9 = *(void **)&v1[v5];
          *(void *)&v1[v5] = v8;
          id v10 = v8;

          swift_getKeyPath();
          swift_getKeyPath();
          swift_retain();
          sub_32A80();

          sub_8DD8();
        }
      }
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t WallpaperSettingsRootViewController.handleURL(_:)(uint64_t a1)
{
  v2[13] = a1;
  v2[14] = v1;
  sub_337A0();
  v2[15] = sub_33790();
  uint64_t v4 = sub_33770();
  return _swift_task_switch(sub_5534, v4, v3);
}

uint64_t sub_5534()
{
  uint64_t v1 = *(void *)(v0 + 104);
  swift_release();
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 104);
    *(void *)(v0 + 88) = 1752457584;
    *(void *)(v0 + 96) = 0xE400000000000000;
    sub_33A80();
    if (*(void *)(v2 + 16) && (unint64_t v3 = sub_6290(v0 + 16), (v4 & 1) != 0))
    {
      sub_6328(*(void *)(v2 + 56) + 32 * v3, v0 + 56);
    }
    else
    {
      *(_OWORD *)(v0 + 56) = 0u;
      *(_OWORD *)(v0 + 72) = 0u;
    }
    sub_62D4(v0 + 16);
    if (!*(void *)(v0 + 80))
    {
      sub_6D44(v0 + 56, &qword_451F8);
      goto LABEL_14;
    }
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_14;
    }
    if (*(void *)(v0 + 88) == 0x615777654E646461 && *(void *)(v0 + 96) == 0xEF72657061706C6CLL)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v5 = sub_33BB0();
      swift_bridgeObjectRelease();
      if ((v5 & 1) == 0) {
        goto LABEL_14;
      }
    }
    sub_52F0();
  }
LABEL_14:
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_5868(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_337A0();
  v3[5] = sub_33790();
  uint64_t v5 = sub_33770();
  return _swift_task_switch(sub_5904, v5, v4);
}

uint64_t sub_5904()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(const void **)(v0 + 24);
  swift_release();
  *(void *)(v0 + 48) = _Block_copy(v2);
  if (v1) {
    uint64_t v3 = sub_33680();
  }
  else {
    uint64_t v3 = 0;
  }
  *(void *)(v0 + 56) = v3;
  id v4 = *(id *)(v0 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v5;
  void *v5 = v0;
  v5[1] = sub_59FC;
  return WallpaperSettingsRootViewController.handleURL(_:)(v3);
}

uint64_t sub_59FC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  uint64_t v3 = *(void **)(*v0 + 32);
  uint64_t v4 = *v0;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  if (v2)
  {
    uint64_t v5 = *(void (***)(void))(v1 + 48);
    v5[2](v5);
    _Block_release(v5);
  }
  uint64_t v6 = *(uint64_t (**)(void))(v4 + 8);
  return v6();
}

void *sub_5B60@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_5B70(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_5B7C(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_5B84@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_5B98(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_5BC8(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_5BDC(void *result)
{
  *v1 &= *result;
  return result;
}

BOOL sub_5BF0(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_5C04@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

Swift::Int sub_5C10()
{
  Swift::UInt v1 = *v0;
  sub_33C30();
  sub_33C40(v1);
  return sub_33C50();
}

void sub_5C58()
{
  sub_33C40(*v0);
}

Swift::Int sub_5C84()
{
  Swift::UInt v1 = *v0;
  sub_33C30();
  sub_33C40(v1);
  return sub_33C50();
}

uint64_t sub_5CC8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_5D0C()
{
  swift_unknownObjectWeakDestroy();

  return swift_deallocObject();
}

void sub_5D44()
{
}

uint64_t sub_5D60(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_5D70()
{
  return swift_release();
}

uint64_t sub_5D78(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_719C;
  return v6();
}

uint64_t sub_5E44(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_719C;
  return v7();
}

uint64_t sub_5F10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_337D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_337C0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_6D44(a1, &qword_48378);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_33770();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_60BC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_6198;
  return v6(a1);
}

uint64_t sub_6198()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  Swift::UInt v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_6290(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_33A60(*(void *)(v2 + 40));

  return sub_6ACC(a1, v4);
}

uint64_t sub_62D4(uint64_t a1)
{
  return a1;
}

uint64_t sub_6328(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t type metadata accessor for WallpaperSettingsRootViewController()
{
  return self;
}

void type metadata accessor for PBUIWallpaperVariant(uint64_t a1)
{
}

void type metadata accessor for BSInterfaceOrientation(uint64_t a1)
{
}

__n128 initializeWithTake for PosterBoardUICoordinator.EntryPoint(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_63E0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_6400(uint64_t result, int a2, int a3)
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

void **initializeBufferWithCopyOfBuffer for WallpaperSettingsRootViewController.ActiveCoordinator(void **a1, void **a2)
{
  char v3 = *a2;
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void destroy for WallpaperSettingsRootViewController.ActiveCoordinator(id *a1)
{
}

void **assignWithCopy for WallpaperSettingsRootViewController.ActiveCoordinator(void **a1, void **a2)
{
  char v3 = *a2;
  id v4 = *a1;
  *a1 = *a2;
  id v5 = v3;

  return a1;
}

void *initializeWithTake for WallpaperSettingsRootViewController.ActiveCoordinator(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

void **assignWithTake for WallpaperSettingsRootViewController.ActiveCoordinator(void **a1, void **a2)
{
  char v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for WallpaperSettingsRootViewController.ActiveCoordinator(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 8)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WallpaperSettingsRootViewController.ActiveCoordinator(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 8) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WallpaperSettingsRootViewController.ActiveCoordinator()
{
  return &type metadata for WallpaperSettingsRootViewController.ActiveCoordinator;
}

uint64_t sub_6584()
{
  return sub_6C10(&qword_45238, type metadata accessor for BSInterfaceOrientation);
}

uint64_t sub_65CC()
{
  _Block_release(*(const void **)(v0 + 24));

  return swift_deallocObject();
}

uint64_t sub_6614()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  id v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_66C8;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_45240 + dword_45240);
  return v6(v2, v3, v4);
}

uint64_t sub_66C8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_67C0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  id v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_719C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_45250 + dword_45250);
  return v6(v2, v3, v4);
}

uint64_t sub_6884()
{
  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_68C4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_719C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_45260 + dword_45260);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_6990()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_69C8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_66C8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_45270 + dword_45270);
  return v6(a1, v4);
}

unint64_t sub_6A88(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_339E0(*(void *)(v2 + 40));

  return sub_6FA8(a1, v4);
}

unint64_t sub_6ACC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_6B94(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_33A70();
      sub_62D4((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_6B94(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_6C00()
{
}

void sub_6C08(uint64_t a1, void *a2)
{
}

uint64_t sub_6C10(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_6C58()
{
  return swift_deallocObject();
}

void sub_6C98(unint64_t a1, uint64_t a2)
{
  sub_4010(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_6CA4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_6CDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5CC8((uint64_t *)&unk_48440);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_6D44(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_5CC8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_6DA0()
{
  return swift_deallocObject();
}

void sub_6DD8()
{
  *(unsigned char *)(*(void *)(v0 + 16) + OBJC_IVAR___WallpaperSettingsRootViewController_handlingCustomizeSelection) = 0;
}

unint64_t sub_6DEC()
{
  unint64_t result = qword_483A0;
  if (!qword_483A0)
  {
    sub_6E48(&qword_48398);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_483A0);
  }
  return result;
}

uint64_t sub_6E48(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_6E90()
{
  return swift_deallocObject();
}

void sub_6ED0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_4D80(*(void *)(v0 + 24), *(void **)(v0 + 32));
  *(unsigned char *)(v1 + OBJC_IVAR___WallpaperSettingsRootViewController_handlingCustomizeSelection) = 0;
}

uint64_t initializeBufferWithCopyOfBuffer for WallpaperAutobahnView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 initializeWithTake for WallpaperSnapshotPairView(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_6F48(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_6F68(uint64_t result, int a2, int a3)
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

unint64_t sub_6FA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_70C4(0, &qword_452A0);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_339F0();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_339F0();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_70C4(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_7114(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t destroy for WallpaperSnapshotPairView()
{
  swift_release();
  swift_release();

  return swift_release();
}

void *initializeWithCopy for WallpaperSnapshotPairView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for WallpaperSnapshotPairView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for WallpaperSnapshotPairView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for WallpaperSnapshotPairView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for WallpaperSnapshotPairView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for WallpaperSnapshotPairView()
{
  return &type metadata for WallpaperSnapshotPairView;
}

uint64_t sub_73A4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_73C0@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for PosterConfigurationCarouselViewModel();
  sub_7828((unint64_t *)&qword_483B8, (void (*)(uint64_t))type metadata accessor for PosterConfigurationCarouselViewModel);
  swift_retain();
  uint64_t v2 = sub_32DA0();
  uint64_t v15 = v3;
  uint64_t KeyPath = swift_getKeyPath();
  type metadata accessor for WallpaperSnapshotViewModel();
  sub_7828(&qword_483C0, (void (*)(uint64_t))type metadata accessor for WallpaperSnapshotViewModel);
  uint64_t v4 = sub_32C30();
  uint64_t v6 = v5;
  swift_retain();
  uint64_t v7 = sub_32DA0();
  uint64_t v9 = v8;
  uint64_t v10 = swift_getKeyPath();
  uint64_t v11 = sub_32C30();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v15;
  *(void *)(a1 + 16) = KeyPath;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = v7;
  *(void *)(a1 + 64) = v9;
  *(void *)(a1 + 72) = v10;
  *(void *)(a1 + 80) = 0;
  *(unsigned char *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = v11;
  *(void *)(a1 + 104) = v12;
  swift_retain();
  sub_7870(KeyPath, 0, 0);
  swift_retain();
  swift_retain();
  sub_7870(v10, 0, 0);
  swift_retain();
  swift_release();
  sub_787C(v10, 0, 0);
  swift_release();
  swift_release();
  sub_787C(KeyPath, 0, 0);

  return swift_release();
}

uint64_t sub_75D4()
{
  return sub_33390();
}

id sub_75F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = sub_32F20();
  sub_73C0((uint64_t)v18);
  char v5 = v19;
  uint64_t v6 = v20;
  uint64_t v7 = v21;
  char v8 = v24;
  uint64_t v9 = v25;
  uint64_t v10 = v26;
  long long v11 = v18[0];
  long long v12 = v18[1];
  long long v13 = v22;
  long long v14 = v23;
  LOBYTE(v18[0]) = 0;
  char v28 = v19;
  char v27 = v24;
  uint64_t v15 = *(void **)(v3 + 16);
  uint64_t v16 = *(void *)(v3 + 32);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = 0x4020000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  *(_OWORD *)(a1 + 24) = v11;
  *(_OWORD *)(a1 + 40) = v12;
  *(unsigned char *)(a1 + 56) = v5;
  *(void *)(a1 + 64) = v6;
  *(void *)(a1 + 72) = v7;
  *(_OWORD *)(a1 + 80) = v13;
  *(_OWORD *)(a1 + 96) = v14;
  *(unsigned char *)(a1 + 112) = v8;
  *(void *)(a1 + 120) = v9;
  *(void *)(a1 + 128) = v10;
  *(void *)(a1 + 136) = v15;
  *(void *)(a1 + 144) = v16;

  return v15;
}

Swift::Int sub_76BC()
{
  uint64_t v2 = *(void **)v0;
  Swift::UInt v1 = *(void *)(v0 + 8);
  sub_33C30();
  id v3 = v2;
  sub_33A00();

  sub_33C40(v1);
  return sub_33C50();
}

void sub_7720()
{
  Swift::UInt v1 = *(void *)(v0 + 8);
  id v2 = *(id *)v0;
  sub_33A00();

  sub_33C40(v1);
}

Swift::Int sub_776C()
{
  id v2 = *(void **)v0;
  Swift::UInt v1 = *(void *)(v0 + 8);
  sub_33C30();
  id v3 = v2;
  sub_33A00();

  sub_33C40(v1);
  return sub_33C50();
}

uint64_t sub_77CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  sub_7A90();
  return sub_339F0() & (v2 == v3);
}

uint64_t sub_7828(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_7870(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_787C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_release();
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for PairID(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  return a1;
}

uint64_t assignWithCopy for PairID(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for PairID(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for PairID(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PairID(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PairID()
{
  return &type metadata for PairID;
}

unint64_t sub_79DC()
{
  unint64_t result = qword_452B0;
  if (!qword_452B0)
  {
    sub_6E48(&qword_452B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_452B0);
  }
  return result;
}

unint64_t sub_7A3C()
{
  unint64_t result = qword_452C0;
  if (!qword_452C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_452C0);
  }
  return result;
}

unint64_t sub_7A90()
{
  unint64_t result = qword_483C8;
  if (!qword_483C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_483C8);
  }
  return result;
}

uint64_t sub_7AD4()
{
  type metadata accessor for NewWallpaperItemWellViewModel();
  uint64_t v0 = swift_allocObject();
  sub_5CC8(&qword_483D0);
  sub_32A60();
  *(unsigned char *)(v0 + OBJC_IVAR____TtC17WallpaperSettings29NewWallpaperItemWellViewModel_isLoading) = 0;
  return v0;
}

uint64_t sub_7B54()
{
  return swift_retain();
}

uint64_t destroy for NewWallpaperItemHomeScreenWell()
{
  return sub_7B6C();
}

uint64_t sub_7B6C()
{
  return swift_release();
}

uint64_t _s17WallpaperSettings30NewWallpaperItemHomeScreenWellVwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_7B54();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for NewWallpaperItemHomeScreenWell(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_7B54();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_7B6C();
  return a1;
}

__n128 initializeWithTake for NewWallpaperItemHomeScreenWell(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for NewWallpaperItemHomeScreenWell(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_7B6C();
  return a1;
}

uint64_t getEnumTagSinglePayload for NewWallpaperItemHomeScreenWell(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for NewWallpaperItemHomeScreenWell(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for NewWallpaperItemHomeScreenWell()
{
  return &type metadata for NewWallpaperItemHomeScreenWell;
}

uint64_t sub_7D10()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_7D2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v64 = a4;
  uint64_t v65 = sub_32F70();
  uint64_t v63 = *(void *)(v65 - 8);
  __chkstk_darwin(v65);
  v62 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_33180();
  uint64_t v55 = *(void *)(v8 - 8);
  uint64_t v56 = v8;
  __chkstk_darwin(v8);
  int v54 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_32BF0();
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  long long v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_337D0();
  uint64_t v52 = *(void *)(v14 - 8);
  uint64_t v53 = v14;
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_5CC8(&qword_483D8);
  __chkstk_darwin(v51);
  id v18 = (uint64_t *)((char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v60 = sub_5CC8(&qword_452C8);
  uint64_t v58 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  uint64_t v50 = (char *)&v48 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_5CC8(&qword_452D0);
  uint64_t v20 = __chkstk_darwin(v61);
  uint64_t v57 = (char *)&v48 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v59 = (char *)&v48 - v22;
  uint64_t v23 = sub_335D0();
  uint64_t v48 = v24;
  uint64_t v49 = v23;
  sub_839C(&v66);
  uint64_t v26 = v66;
  unint64_t v25 = v67;
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = a1;
  *(void *)(v27 + 24) = a2;
  *(unsigned char *)(v27 + 32) = a3 & 1;
  sub_7B54();
  sub_337B0();
  uint64_t v29 = v52;
  uint64_t v28 = v53;
  (*(void (**)(char *, char *, uint64_t))(v52 + 16))(&v13[*(int *)(v11 + 28)], v16, v53);
  *(void *)long long v13 = &unk_452E0;
  *((void *)v13 + 1) = v27;
  unint64_t v31 = v50;
  uint64_t v30 = v51;
  sub_89FC((uint64_t)v13, (uint64_t)v18 + *(int *)(v51 + 36));
  uint64_t v32 = v48;
  *id v18 = v49;
  v18[1] = v32;
  _OWORD v18[2] = v26;
  v18[3] = v25;
  v18[4] = 0;
  swift_retain();
  swift_retain();
  sub_8A60((uint64_t)v13);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v16, v28);
  swift_release();
  swift_release();
  uint64_t v33 = v54;
  sub_33170();
  unint64_t v34 = sub_8ABC();
  sub_333F0();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v33, v56);
  sub_6D44((uint64_t)v18, &qword_483D8);
  sub_32F30();
  if (qword_48330 != -1) {
    swift_once();
  }
  id v35 = (id)qword_4A3D0;
  uint64_t v36 = sub_33300();
  uint64_t v38 = v37;
  char v40 = v39 & 1;
  uint64_t v66 = v30;
  unint64_t v67 = v34;
  swift_getOpaqueTypeConformance2();
  uint64_t v41 = (uint64_t)v57;
  uint64_t v42 = v60;
  sub_333C0();
  sub_8C94(v36, v38, v40);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v31, v42);
  v43 = v62;
  sub_32F60();
  uint64_t v44 = (uint64_t)v59;
  sub_32CC0();
  v45 = *(void (**)(char *, uint64_t))(v63 + 8);
  uint64_t v46 = v65;
  v45(v43, v65);
  sub_6D44(v41, &qword_452D0);
  sub_32F50();
  sub_32CB0();
  v45(v43, v46);
  return sub_6D44(v44, &qword_452D0);
}

uint64_t sub_839C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_33490();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [self systemGray5Color];
  uint64_t v7 = sub_33460();
  type metadata accessor for NewWallpaperItemWellViewModel();
  sub_8D90(&qword_48410, (void (*)(uint64_t))type metadata accessor for NewWallpaperItemWellViewModel);
  sub_32B10();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_32A70();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  if (v12)
  {
    id v9 = v12;
    sub_33470();
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Image.ResizingMode.stretch(_:), v2);
    uint64_t v10 = sub_334B0();

    swift_release();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    uint64_t v10 = 0;
  }
  *a1 = v7;
  a1[1] = v10;
  return result;
}

uint64_t sub_85C8(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v3 + 72) = a3;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a2;
  sub_337A0();
  *(void *)(v3 + 32) = sub_33790();
  uint64_t v5 = sub_33770();
  *(void *)(v3 + 40) = v5;
  *(void *)(v3 + 48) = v4;
  return _swift_task_switch(sub_8664, v5, v4);
}

uint64_t sub_8664()
{
  type metadata accessor for NewWallpaperItemWellViewModel();
  sub_8D90(&qword_48410, (void (*)(uint64_t))type metadata accessor for NewWallpaperItemWellViewModel);
  *(void *)(v0 + 56) = sub_32B10();
  Swift::UInt v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  void *v1 = v0;
  v1[1] = sub_8768;
  return sub_2BF14(1);
}

uint64_t sub_8768()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 48);
  uint64_t v3 = *(void *)(v1 + 40);
  return _swift_task_switch(sub_88AC, v3, v2);
}

uint64_t sub_88AC()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_890C@<X0>(uint64_t a1@<X8>)
{
  return sub_7D2C(*(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16), a1);
}

uint64_t sub_8918()
{
  sub_7B6C();

  return swift_deallocObject();
}

uint64_t sub_8954()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  char v4 = *(unsigned char *)(v0 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_66C8;
  return sub_85C8(v2, v3, v4);
}

uint64_t sub_89FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_32BF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_8A60(uint64_t a1)
{
  uint64_t v2 = sub_32BF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_8ABC()
{
  unint64_t result = qword_483E0;
  if (!qword_483E0)
  {
    sub_6E48(&qword_483D8);
    sub_8B68();
    sub_8D90(&qword_452E8, (void (*)(uint64_t))&type metadata accessor for _TaskModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_483E0);
  }
  return result;
}

unint64_t sub_8B68()
{
  unint64_t result = qword_483E8;
  if (!qword_483E8)
  {
    sub_6E48(&qword_483F0);
    sub_8BE4();
    sub_8C40();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_483E8);
  }
  return result;
}

unint64_t sub_8BE4()
{
  unint64_t result = qword_483F8;
  if (!qword_483F8)
  {
    sub_6E48(&qword_48400);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_483F8);
  }
  return result;
}

unint64_t sub_8C40()
{
  unint64_t result = qword_48408;
  if (!qword_48408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48408);
  }
  return result;
}

uint64_t sub_8C94(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_8CB0()
{
  unint64_t result = qword_452F0;
  if (!qword_452F0)
  {
    sub_6E48(&qword_452D0);
    sub_6E48(&qword_483D8);
    sub_8ABC();
    swift_getOpaqueTypeConformance2();
    sub_8D90(&qword_452F8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_452F0);
  }
  return result;
}

uint64_t sub_8D90(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_8DD8()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC17WallpaperSettings24PosterBoardUICoordinator_entryPoint + 8);
  if (v1)
  {
    if (*(void *)(v0 + OBJC_IVAR____TtC17WallpaperSettings24PosterBoardUICoordinator_entryPoint) == 1) {
      uint64_t v2 = (objc_class *)PRUISModalEntryPointEditHomeScreen;
    }
    else {
      uint64_t v2 = (objc_class *)PRUISModalEntryPointEditing;
    }
    id v3 = [objc_allocWithZone(v2) initWithServiceConfiguration:v1];
  }
  else
  {
    id v3 = [objc_allocWithZone((Class)PRUISModalEntryPointGallery) init];
  }
  id v4 = [objc_allocWithZone((Class)PRUISModalController) initWithEntryPoint:v3];
  swift_unknownObjectRelease();
  uint64_t v5 = OBJC_IVAR____TtC17WallpaperSettings24PosterBoardUICoordinator_modalController;
  id v6 = *(void **)(v0 + OBJC_IVAR____TtC17WallpaperSettings24PosterBoardUICoordinator_modalController);
  *(void *)(v0 + OBJC_IVAR____TtC17WallpaperSettings24PosterBoardUICoordinator_modalController) = v4;

  id result = *(id *)(v0 + v5);
  if (!result)
  {
    __break(1u);
    goto LABEL_13;
  }
  [result setDelegate:v0];
  id result = *(id *)(v0 + v5);
  if (!result)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  uint64_t v8 = *(void *)(v0 + OBJC_IVAR____TtC17WallpaperSettings24PosterBoardUICoordinator_windowScene);

  return [result presentFromWindowScene:v8];
}

NSString sub_8EEC()
{
  NSString result = sub_336D0();
  qword_4A3C0 = (uint64_t)result;
  return result;
}

NSString sub_8F24()
{
  NSString result = sub_336D0();
  qword_4A3C8 = (uint64_t)result;
  return result;
}

id sub_8F5C(void *a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  ObjectType = (objc_class *)swift_getObjectType();
  sub_5CC8(&qword_48378);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v4[OBJC_IVAR____TtC17WallpaperSettings24PosterBoardUICoordinator_childCoordinators] = &_swiftEmptyArrayStorage;
  *(void *)&v4[OBJC_IVAR____TtC17WallpaperSettings24PosterBoardUICoordinator_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v4[OBJC_IVAR____TtC17WallpaperSettings24PosterBoardUICoordinator_modalController] = 0;
  *(void *)&v4[OBJC_IVAR____TtC17WallpaperSettings24PosterBoardUICoordinator_windowScene] = a1;
  uint64_t v11 = &v4[OBJC_IVAR____TtC17WallpaperSettings24PosterBoardUICoordinator_entryPoint];
  *(void *)uint64_t v11 = a2;
  *((void *)v11 + 1) = a3;
  v19.receiver = v4;
  v19.super_class = ObjectType;
  id v12 = a1;
  id v13 = a3;
  id v14 = objc_msgSendSuper2(&v19, "init");
  uint64_t v15 = sub_337D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v10, 1, 1, v15);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = v14;
  id v17 = v14;
  sub_964C((uint64_t)v10, (uint64_t)&unk_45428, (uint64_t)v16);
  swift_release();

  return v17;
}

uint64_t sub_9114(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a4;
  sub_5CC8(&qword_48450);
  v4[4] = swift_task_alloc();
  uint64_t v5 = sub_339B0();
  v4[5] = v5;
  v4[6] = *(void *)(v5 - 8);
  v4[7] = swift_task_alloc();
  return _swift_task_switch(sub_9204, 0, 0);
}

uint64_t sub_9204()
{
  id v1 = [self defaultCenter];
  sub_339C0();

  sub_339A0();
  v0[8] = OBJC_IVAR____TtC17WallpaperSettings24PosterBoardUICoordinator_modalController;
  unint64_t v2 = sub_A78C();
  id v3 = (void *)swift_task_alloc();
  v0[9] = v3;
  *id v3 = v0;
  v3[1] = sub_9310;
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[5];
  return dispatch thunk of AsyncIteratorProtocol.next()(v4, v5, v2);
}

uint64_t sub_9310()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    unint64_t v2 = sub_95C8;
  }
  else {
    unint64_t v2 = sub_9424;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_9424()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = sub_32820();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(v0[6] + 8))(v0[7], v0[5]);
LABEL_8:
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
  id v3 = *(void **)(v0[3] + v0[8]);
  if (!v3)
  {
    (*(void (**)(void, void))(v0[6] + 8))(v0[7], v0[5]);
    sub_6D44(v1, &qword_48450);
    goto LABEL_8;
  }
  [v3 handleHostSceneTransitionedFromActiveState];
  sub_6D44(v1, &qword_48450);
  unint64_t v4 = sub_A78C();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[9] = v5;
  void *v5 = v0;
  v5[1] = sub_9310;
  uint64_t v6 = v0[4];
  uint64_t v7 = v0[5];
  return dispatch thunk of AsyncIteratorProtocol.next()(v6, v7, v4);
}

uint64_t sub_95C8()
{
  *(void *)(v0 + 16) = *(void *)(v0 + 80);
  sub_5CC8(&qword_48460);
  uint64_t v1 = swift_dynamicCast();
  return _swift_willThrowTypedImpl(v1, &type metadata for Never, &protocol witness table for Never);
}

uint64_t sub_964C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_337D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_337C0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_6D44(a1, &qword_48378);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_33770();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t type metadata accessor for PosterBoardUICoordinator()
{
  return self;
}

unint64_t sub_9914(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_5CC8(&qword_45408);
  uint64_t v2 = sub_33B80();
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
    sub_A508(v6, (uint64_t)v15);
    unint64_t result = sub_6290((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_A570(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_9A44(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_5CC8(&qword_45448);
  uint64_t v2 = (void *)sub_33B80();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_6A88((uint64_t)v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 2;
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

void *initializeBufferWithCopyOfBuffer for PosterBoardUICoordinator.EntryPoint(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  id v4 = v3;
  return a1;
}

void destroy for PosterBoardUICoordinator.EntryPoint(uint64_t a1)
{
}

void *assignWithCopy for PosterBoardUICoordinator.EntryPoint(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = (void *)a2[1];
  id v4 = (void *)a1[1];
  a1[1] = v3;
  id v5 = v3;

  return a1;
}

void *assignWithTake for PosterBoardUICoordinator.EntryPoint(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  id v4 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for PosterBoardUICoordinator.EntryPoint(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PosterBoardUICoordinator.EntryPoint(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

uint64_t sub_9D88(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_9DA0(void *result, int a2)
{
  if (a2 < 0)
  {
    *unint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for PosterBoardUICoordinator.EntryPoint()
{
  return &type metadata for PosterBoardUICoordinator.EntryPoint;
}

void sub_9DD0(void *a1)
{
  uint64_t v3 = sub_5CC8((uint64_t *)&unk_48440);
  __chkstk_darwin(v3 - 8);
  id v5 = (char *)v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_328E0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  BOOL v12 = (char *)v29 - v11;
  uint64_t v13 = *(void **)(v1 + OBJC_IVAR____TtC17WallpaperSettings24PosterBoardUICoordinator_entryPoint + 8);
  if (v13)
  {
    uint64_t v14 = *(void *)(v1 + OBJC_IVAR____TtC17WallpaperSettings24PosterBoardUICoordinator_entryPoint);
    id v30 = v13;
    if ([a1 result] == (char *)&dword_0 + 1)
    {
      v29[1] = v14;
      id v15 = [self defaultCenter];
      if (qword_48340 != -1) {
        swift_once();
      }
      v29[0] = qword_4A3E0;
      sub_5CC8(&qword_453F8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_34B60;
      unint64_t v31 = 0xD000000000000010;
      unint64_t v32 = 0x80000000000370D0;
      sub_A4B4();
      sub_33A80();
      id v17 = [v30 serverUUID];
      if (v17)
      {
        id v18 = v17;
        sub_328D0();

        objc_super v19 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
        v19(v5, v10, v6);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
        {
          v19(v12, v5, v6);
          uint64_t v20 = sub_328C0();
          uint64_t v22 = v21;
          (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
          *(void *)(inited + 96) = &type metadata for String;
          *(void *)(inited + 72) = v20;
          *(void *)(inited + 80) = v22;
          unint64_t v31 = 0xD000000000000017;
          unint64_t v32 = 0x80000000000370F0;
          sub_33A80();
          id v23 = (id)PBUIStringForWallpaperVariant();
          uint64_t v24 = sub_336E0();
          uint64_t v26 = v25;

          *(void *)(inited + 168) = &type metadata for String;
          *(void *)(inited + 144) = v24;
          *(void *)(inited + 152) = v26;
          sub_9914(inited);
          Class isa = sub_33670().super.isa;
          swift_bridgeObjectRelease();
          [v15 postNotificationName:v29[0] object:0 userInfo:isa];

          return;
        }
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
      }
      __break(1u);
      return;
    }
    id v28 = v30;
  }
}

void sub_A238()
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = *(void **)(Strong + OBJC_IVAR___WallpaperSettingsRootViewController_activeCoordinator);
    *(void *)(Strong + OBJC_IVAR___WallpaperSettingsRootViewController_activeCoordinator) = 0;

    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_32A80();
    swift_unknownObjectRelease();
  }
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC17WallpaperSettings24PosterBoardUICoordinator_modalController);
  *(void *)(v0 + OBJC_IVAR____TtC17WallpaperSettings24PosterBoardUICoordinator_modalController) = 0;

  uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC17WallpaperSettings24PosterBoardUICoordinator_entryPoint + 8);
  if (v4)
  {
    id v5 = v4;
    id v6 = [v5 providerBundleIdentifier];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = sub_336E0();
      uint64_t v10 = v9;

      if (v8 == 0xD000000000000021 && v10 == 0x8000000000037040)
      {
        swift_bridgeObjectRelease();
LABEL_12:
        id v11 = [self defaultCenter];
        if (qword_48328 != -1) {
          swift_once();
        }
        [v11 postNotificationName:qword_4A3C8 object:0];

        goto LABEL_16;
      }
      char v12 = sub_33BB0();
      swift_bridgeObjectRelease();
      if (v12) {
        goto LABEL_12;
      }
    }
    id v11 = v5;
    goto LABEL_16;
  }
  id v11 = [self defaultCenter];
  if (qword_48320 != -1) {
    swift_once();
  }
  [v11 postNotificationName:qword_4A3C0 object:0];
LABEL_16:
}

unint64_t sub_A4B4()
{
  unint64_t result = qword_45400;
  if (!qword_45400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_45400);
  }
  return result;
}

uint64_t sub_A508(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5CC8((uint64_t *)&unk_45410);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_A570(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_A580(uint64_t a1)
{
  return a1;
}

uint64_t sub_A5A8()
{
  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_A5E8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_66C8;
  return sub_9114(a1, v4, v5, v6);
}

uint64_t sub_A69C()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_A6D4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_66C8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_45430 + dword_45430);
  return v6(a1, v4);
}

unint64_t sub_A78C()
{
  unint64_t result = qword_48458;
  if (!qword_48458)
  {
    sub_339B0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48458);
  }
  return result;
}

__n128 initializeWithCopy for ScaleEffectScrollViewBoundsModifier(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for ScaleEffectScrollViewBoundsModifier(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ScaleEffectScrollViewBoundsModifier(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
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
  *(unsigned char *)(result + 41) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ScaleEffectScrollViewBoundsModifier()
{
  return &type metadata for ScaleEffectScrollViewBoundsModifier;
}

uint64_t sub_A864()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_A888()
{
  return sub_32B50();
}

uint64_t sub_A8A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double v5 = 1.0;
  if ((*(unsigned char *)(v2 + 40) & 1) == 0)
  {
    double v6 = 1.0 - fabs(CGRectGetMidX(*(CGRect *)(v2 + 8)) + *(double *)v2 * -0.5) / *(double *)v2;
    double v5 = 0.93;
    if (v6 > 0.93) {
      double v5 = v6;
    }
  }
  sub_33610();
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = sub_5CC8(&qword_48468);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(a2, a1, v11);
  uint64_t result = sub_5CC8(&qword_48470);
  uint64_t v13 = (double *)(a2 + *(int *)(result + 36));
  *uint64_t v13 = v5;
  v13[1] = v5;
  *((void *)v13 + 2) = v8;
  *((void *)v13 + 3) = v10;
  return result;
}

unint64_t sub_A998()
{
  unint64_t result = qword_48478;
  if (!qword_48478)
  {
    sub_6E48(&qword_48470);
    sub_AA14();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48478);
  }
  return result;
}

unint64_t sub_AA14()
{
  unint64_t result = qword_48480;
  if (!qword_48480)
  {
    sub_6E48(&qword_48468);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48480);
  }
  return result;
}

ValueMetadata *type metadata accessor for PosterGestureTutorialLayout()
{
  return &type metadata for PosterGestureTutorialLayout;
}

unint64_t sub_AA84()
{
  unint64_t result = qword_454B0;
  if (!qword_454B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_454B0);
  }
  return result;
}

uint64_t sub_AAD8@<X0>(uint64_t a1@<X8>)
{
  sub_32C20();
  sub_BC84((unint64_t *)&qword_48498);
  sub_33840();
  sub_33890();
  if (v9[4] == v9[0])
  {
    uint64_t v2 = sub_32BE0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(a1, 1, 1, v2);
  }
  else
  {
    uint64_t v4 = (void (*)(void *, void))sub_338C0();
    uint64_t v6 = v5;
    uint64_t v7 = sub_32BE0();
    uint64_t v8 = *(void *)(v7 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(a1, v6, v7);
    v4(v9, 0);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  }
}

uint64_t sub_AC60(uint64_t a1)
{
  uint64_t result = sub_AF78(a1);
  uint64_t v5 = result;
  uint64_t v6 = v3;
  int v7 = v4 & 1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t result = sub_33B40();
    if (v7)
    {
      uint64_t v9 = result;
      uint64_t v10 = v8;
      char v11 = sub_33AF0();
      sub_BCC8(v9, v10, 1);
      if (v11)
      {
LABEL_4:
        sub_BCC8(v5, v6, v7);
        return 0;
      }
LABEL_8:
      sub_B03C(&v14, v5, v6, v7, a1);
      uint64_t v12 = v13;
      sub_BCC8(v5, v6, v7);
      return v12;
    }
  }
  else if ((v4 & 1) == 0)
  {
    if (*(_DWORD *)(a1 + 36) == v3)
    {
      if (result == 1 << *(unsigned char *)(a1 + 32)) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

double sub_AD8C(uint64_t a1, char a2)
{
  return sub_B268(a1, a2 & 1);
}

uint64_t sub_AD9C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  return sub_B6DC(a7, a8 & 1, a1, a2, a3, a4);
}

uint64_t sub_ADB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_AE20(a1, a2, a3, a4, a5, a6, a7, a8, a9, (uint64_t (*)(uint64_t))&Layout.explicitAlignment(of:in:proposal:subviews:cache:));
}

uint64_t sub_ADE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_AE20(a1, a2, a3, a4, a5, a6, a7, a8, a9, (uint64_t (*)(uint64_t))&Layout.explicitAlignment(of:in:proposal:subviews:cache:));
}

uint64_t sub_AE20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t))
{
  return a10(a1);
}

void (*sub_AE64(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_32AA0();
  return sub_AED4;
}

void sub_AED4(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

unint64_t sub_AF24()
{
  unint64_t result = qword_48488;
  if (!qword_48488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48488);
  }
  return result;
}

uint64_t sub_AF78(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0) {
    return sub_33AD0();
  }
  unint64_t v2 = *(void *)(a1 + 64);
  if (v2)
  {
    uint64_t v3 = 0;
    return __clz(__rbit64(v2)) + v3;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v1 = 1 << v5;
  if (v6 < 7) {
    return v1;
  }
  unint64_t v2 = *(void *)(a1 + 72);
  if (v2)
  {
    uint64_t v3 = 64;
    return __clz(__rbit64(v2)) + v3;
  }
  unint64_t v7 = (unint64_t)(v1 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v3 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v2 = v10;
    --v8;
    v3 += 64;
    if (v10) {
      return __clz(__rbit64(v2)) + v3;
    }
  }
  return v1;
}

void sub_B03C(void *a1, uint64_t a2, int a3, char a4, uint64_t a5)
{
  unint64_t v6 = a2;
  if ((a5 & 0xC000000000000001) != 0)
  {
    if (a4)
    {
      sub_33B20();
      sub_70C4(0, &qword_452A0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      sub_70C4(0, &qword_454B8);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v13;
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_18;
  }
  if (a4)
  {
LABEL_10:
    if (sub_33B00() == *(_DWORD *)(a5 + 36))
    {
      sub_33B10();
      sub_70C4(0, &qword_452A0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      unint64_t v6 = sub_6A88((uint64_t)v13);
      char v9 = v8;

      if (v9) {
        goto LABEL_12;
      }
LABEL_17:
      __break(1u);
LABEL_18:
      __break(1u);
      return;
    }
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2) & 1) == 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (*(_DWORD *)(a5 + 36) != a3)
  {
    __break(1u);
    goto LABEL_10;
  }
LABEL_12:
  unint64_t v10 = *(void **)(*(void *)(a5 + 48) + 8 * v6);
  char v11 = *(void **)(*(void *)(a5 + 56) + 8 * v6);
  *a1 = v11;
  v10;
  id v12 = v11;
}

double sub_B268(uint64_t a1, int a2)
{
  int v36 = a2;
  uint64_t v3 = sub_5CC8(&qword_48490);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  unint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  char v8 = (char *)&v30 - v7;
  uint64_t v9 = sub_32BE0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  id v15 = (char *)&v30 - v14;
  sub_32C20();
  sub_BC84((unint64_t *)&qword_48498);
  sub_33840();
  sub_33890();
  double v16 = 0.0;
  if (sub_33880() == 2)
  {
    unint64_t v34 = v6;
    id v35 = v15;
    char v17 = v36;
    double v32 = *(double *)&a1;
    uint64_t v33 = v13;
    sub_AAD8((uint64_t)v8);
    id v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
    if (v18(v8, 1, v9) == 1)
    {
      uint64_t v19 = (uint64_t)v8;
LABEL_8:
      sub_BC24(v19);
      return v16;
    }
    uint64_t v20 = v10;
    uint64_t v21 = v8;
    uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v22(v35, v21, v9);
    if (sub_33870())
    {
      uint64_t v23 = (uint64_t)v34;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v34, 1, 1, v9);
LABEL_7:
      (*(void (**)(char *, uint64_t))(v20 + 8))(v35, v9);
      uint64_t v19 = v23;
      goto LABEL_8;
    }
    unint64_t v31 = (void (*)(char *, uint64_t, uint64_t))v22;
    sub_33890();
    sub_BC84(qword_484A0);
    sub_33690();
    uint64_t v24 = (void (*)(char *, void))sub_338C0();
    uint64_t v23 = (uint64_t)v34;
    (*(void (**)(char *))(v20 + 16))(v34);
    v24(v37, 0);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v20 + 56))(v23, 0, 1, v9);
    if (v18((char *)v23, 1, v9) == 1) {
      goto LABEL_7;
    }
    uint64_t v26 = v33;
    v31(v33, v23, v9);
    uint64_t v27 = v35;
    if (v17)
    {
      uint64_t v29 = *(void (**)(char *, uint64_t))(v20 + 8);
      v29(v26, v9);
      v29(v27, v9);
    }
    else
    {
      double v16 = v32;
      v37[0] = 0;
      char v38 = 1;
      sub_32BC0();
      v37[0] = 0;
      char v38 = 1;
      sub_32BC0();
      id v28 = *(void (**)(char *, uint64_t))(v20 + 8);
      v28(v26, v9);
      v28(v27, v9);
    }
  }
  return v16;
}

uint64_t sub_B6DC(uint64_t a1, int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  LODWORD(v39) = a2;
  uint64_t v11 = sub_5CC8(&qword_48490);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  double v16 = (char *)&v35 - v15;
  uint64_t v17 = sub_32BE0();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v35 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v35 - v22;
  sub_32C20();
  sub_BC84((unint64_t *)&qword_48498);
  sub_33840();
  sub_33890();
  uint64_t result = sub_33880();
  if (result == 2)
  {
    uint64_t v37 = a1;
    char v38 = v21;
    sub_AAD8((uint64_t)v16);
    uint64_t v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
    if (v25(v16, 1, v17) == 1) {
      return sub_BC24((uint64_t)v16);
    }
    uint64_t v26 = *(void (**)(void))(v18 + 32);
    int v36 = v23;
    uint64_t v27 = v26;
    v26();
    if (sub_33870())
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v14, 1, 1, v17);
LABEL_7:
      (*(void (**)(char *, uint64_t))(v18 + 8))(v36, v17);
      return sub_BC24((uint64_t)v14);
    }
    sub_33890();
    sub_BC84(qword_484A0);
    sub_33690();
    id v28 = (void (*)(char *, void))sub_338C0();
    (*(void (**)(char *))(v18 + 16))(v14);
    v28(v40, 0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v14, 0, 1, v17);
    if (v25(v14, 1, v17) == 1) {
      goto LABEL_7;
    }
    uint64_t v29 = v38;
    ((void (*)(char *, char *, uint64_t))v27)(v38, v14, v17);
    v42.origin.x = a3;
    v42.origin.y = a4;
    v42.size.width = a5;
    v42.size.height = a6;
    CGRectGetWidth(v42);
    v40[0] = 0;
    char v30 = v39 & 1;
    char v41 = v39 & 1;
    unint64_t v31 = v36;
    sub_32BC0();
    uint64_t v35 = v32;
    v43.origin.x = a3;
    v43.origin.y = a4;
    v43.size.width = a5;
    v43.size.height = a6;
    CGRectGetWidth(v43);
    v40[0] = 0;
    char v41 = v30;
    sub_32BC0();
    uint64_t v39 = v33;
    v44.origin.x = a3;
    v44.origin.y = a4;
    v44.size.width = a5;
    v44.size.height = a6;
    CGRectGetMinX(v44);
    v45.origin.x = a3;
    v45.origin.y = a4;
    v45.size.width = a5;
    v45.size.height = a6;
    CGRectGetMinY(v45);
    sub_33600();
    v40[0] = 0;
    char v41 = 0;
    sub_32BD0();
    v46.origin.x = a3;
    v46.origin.y = a4;
    v46.size.width = a5;
    v46.size.height = a6;
    CGRectGetMaxX(v46);
    v47.origin.x = a3;
    v47.origin.y = a4;
    v47.size.width = a5;
    v47.size.height = a6;
    CGRectGetMinY(v47);
    sub_33600();
    v40[0] = 0;
    char v41 = 0;
    sub_32BD0();
    unint64_t v34 = *(void (**)(char *, uint64_t))(v18 + 8);
    v34(v29, v17);
    return ((uint64_t (*)(char *, uint64_t))v34)(v31, v17);
  }
  return result;
}

uint64_t sub_BC24(uint64_t a1)
{
  uint64_t v2 = sub_5CC8(&qword_48490);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_BC84(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_32C20();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_BCC8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_BCD8()
{
  uint64_t result = sub_33560();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_initClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_BDAC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(a1);
  char v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v6 + 16);
  uint64_t v10 = sub_33560();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v16 - v12;
  v16[0] = v9;
  v16[1] = v4;
  long long v17 = *(_OWORD *)(a1 + 32);
  type metadata accessor for PageIndex.Coordinator(0, (uint64_t)v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v2, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v2 + *(int *)(a1 + 52), v4);
  uint64_t v14 = swift_allocObject();
  sub_C450((uint64_t)v13, (uint64_t)v8);
  return v14;
}

uint64_t sub_BF60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  sub_C450(a1, a2);
  return v4;
}

uint64_t sub_BFB0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v24 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v24 - 8);
  uint64_t v7 = __chkstk_darwin(a1);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(v10 + 24);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v7);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getWitnessTable();
  sub_331A0();
  sub_33190();
  uint64_t v15 = v25;
  uint64_t v16 = *(int *)(a3 + 52);
  uint64_t v23 = v3;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v3 + v16, v11);
  uint64_t v17 = (uint64_t)v15 + *(void *)(*(void *)v15 + 120);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 40))(v17, v14, v11);
  swift_endAccess();
  id v18 = [a1 numberOfPages];
  if (v18 != (id)sub_33850()) {
    [a1 setNumberOfPages:sub_33850()];
  }
  uint64_t v19 = v24;
  sub_33560();
  sub_33530();
  sub_338B0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v19);
  if (v26 != 1)
  {
    id v20 = v25;
    if (v20 != [a1 currentPage]) {
      [a1 setCurrentPage:v20];
    }
  }
  return swift_release();
}

id sub_C28C(uint64_t a1, uint64_t *a2)
{
  return sub_DB20(a1, a2[2], a2[3], a2[4], a2[5]);
}

uint64_t sub_C2A8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_BDAC(a1);
  *a2 = result;
  return result;
}

uint64_t sub_C2D4()
{
  return sub_33000();
}

uint64_t sub_C318(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, WitnessTable);
}

uint64_t sub_C394(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, WitnessTable);
}

void sub_C410()
{
}

uint64_t *sub_C450(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = (uint64_t)v2 + *(void *)(*v2 + 112);
  uint64_t v7 = sub_33560();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v6, a1, v7);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v5 + 88) - 8) + 32))((uint64_t)v2 + *(void *)(*v2 + 120), a2);
  return v2;
}

uint64_t sub_C54C(void *a1)
{
  id v32 = a1;
  uint64_t v2 = *(void **)v1;
  uint64_t v31 = *(void *)(*(void *)v1 + 80);
  uint64_t v30 = *(void *)(v31 - 8);
  __chkstk_darwin(a1);
  uint64_t v29 = (char *)&v24 - v3;
  uint64_t v4 = *(void *)(*(void *)(v2[13] + 8) + 8);
  uint64_t v5 = v2[11];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = __chkstk_darwin(AssociatedTypeWitness);
  uint64_t v10 = (char *)&v24 - v9;
  uint64_t v11 = *(void *)(v5 - 8);
  __chkstk_darwin(v8);
  uint64_t v13 = (char *)&v24 - v12;
  uint64_t v14 = v2[15];
  uint64_t v27 = v1;
  uint64_t v15 = v1 + v14;
  swift_beginAccess();
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v25(v13, v15, v5);
  sub_33860();
  char v26 = *(void (**)(char *, uint64_t))(v11 + 8);
  v26(v13, v5);
  v33[0] = [v32 currentPage];
  uint64_t v28 = v4;
  swift_getAssociatedConformanceWitness();
  char v16 = sub_33740();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, AssociatedTypeWitness);
  if (v16)
  {
    v25(v13, v15, v5);
    id v18 = v32;
    v33[4] = [v32 currentPage];
    uint64_t v19 = (void (*)(void *, void))sub_338C0();
    uint64_t v21 = v29;
    uint64_t v20 = v30;
    uint64_t v22 = v31;
    (*(void (**)(char *))(v30 + 16))(v29);
    v19(v33, 0);
    v26(v13, v5);
    uint64_t v23 = (char *)[v18 interactionState];
    if (v23 != (unsigned char *)&dword_0 + 2) {
      uint64_t v23 = (char *)sub_335F0();
    }
    __chkstk_darwin(v23);
    *(&v24 - 2) = v27;
    *(&v24 - 1) = (uint64_t)v21;
    sub_32C00();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v21, v22);
  }
  return result;
}

uint64_t sub_C980(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *(void *)(*a1 + 80);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(a1);
  uint64_t v8 = (char *)&v14 - v7;
  uint64_t v9 = sub_33560();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v14 - v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v14 - v11, (uint64_t)a1 + *(void *)(v4 + 112), v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a2, v5);
  sub_33540();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_CB40(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  swift_retain();
  sub_C54C(v3);

  return swift_release();
}

uint64_t *sub_CB90()
{
  uint64_t v1 = *v0;
  uint64_t v2 = (uint64_t)v0 + *(void *)(*v0 + 112);
  uint64_t v3 = sub_33560();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 88) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 120));
  return v0;
}

uint64_t sub_CC74()
{
  sub_CB90();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t type metadata accessor for PageIndex.Coordinator(uint64_t a1, uint64_t a2)
{
  return _swift_getGenericMetadata(a1, a2, &nominal type descriptor for PageIndex.Coordinator);
}

uint64_t sub_CCE4()
{
  return sub_C980(*(uint64_t **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_CD00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 40);
}

uint64_t sub_CD08()
{
  uint64_t result = sub_33560();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_CDD8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v4 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v7 = *(_DWORD *)(v6 + 80);
  uint64_t v8 = *(void *)(v4 - 8);
  uint64_t v9 = *(_DWORD *)(v8 + 80);
  uint64_t v10 = ((v7 + 16) & ~v7) + *(void *)(v6 + 64) + v9;
  unint64_t v11 = (v10 & ~v9) + *(void *)(v8 + 64);
  int v12 = (*(_DWORD *)(v8 + 80) | *(_DWORD *)(v6 + 80)) & 0x100000;
  uint64_t v13 = *a2;
  *a1 = *a2;
  if ((v9 | v7) > 7 || v12 != 0 || v11 > 0x18)
  {
    a1 = (uint64_t *)(v13 + (((v9 | v7) & 0xF8 ^ 0x1F8) & ((v9 | v7) + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v17 = ~v9;
    id v18 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v19 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
    *id v18 = *v19;
    uint64_t v23 = ((unint64_t)v18 + v7 + 8) & ~v7;
    uint64_t v24 = v4;
    uint64_t v20 = ((unint64_t)v19 + v7 + 8) & ~v7;
    uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    swift_retain();
    swift_retain();
    v21(v23, v20, v5);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))(((unint64_t)a1 + v10) & v17, ((unint64_t)a2 + v10) & v17, v24);
  }
  return a1;
}

uint64_t sub_CFA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 15;
  swift_release();
  swift_release();
  uint64_t v5 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v6 = v5 + 8;
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  (*(void (**)(unint64_t))(v5 + 8))(((v4 & 0xFFFFFFFFFFFFFFF8) + v7 + 8) & ~v7);
  uint64_t v8 = *(void *)(*(void *)(a2 + 24) - 8);
  uint64_t v9 = *(uint64_t (**)(unint64_t))(v8 + 8);
  unint64_t v10 = (*(void *)(v6 + 56) + a1 + *(unsigned __int8 *)(v8 + 80) + ((v7 + 16) & ~v7)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);

  return v9(v10);
}

void *sub_D084(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v7 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v6 = *v7;
  uint64_t v8 = *(void *)(a3 + 16);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16);
  uint64_t v10 = *(void *)(v8 - 8) + 16;
  uint64_t v11 = *(unsigned __int8 *)(*(void *)(v8 - 8) + 80);
  uint64_t v12 = ((unint64_t)v6 + v11 + 8) & ~v11;
  uint64_t v13 = ((unint64_t)v7 + v11 + 8) & ~v11;
  swift_retain();
  swift_retain();
  v9(v12, v13, v8);
  uint64_t v14 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v15 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = ((v11 + 16) & ~v11) + *(void *)(v10 + 48) + v15;
  (*(void (**)(unint64_t, unint64_t))(v14 + 16))(((unint64_t)a1 + v16) & ~v15, ((unint64_t)a2 + v16) & ~v15);
  return a1;
}

void *sub_D1A0(void *a1, void *a2, uint64_t a3)
{
  unint64_t v6 = (unint64_t)a2 + 15;
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v7 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  v6 &= 0xFFFFFFFFFFFFFFF8;
  void *v7 = *(void *)v6;
  swift_retain();
  swift_release();
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v9 = v8 + 24;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  (*(void (**)(unint64_t, unint64_t))(v8 + 24))(((unint64_t)v7 + v10 + 8) & ~v10, (v10 + 8 + v6) & ~v10);
  uint64_t v11 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v12 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v13 = ((v10 + 16) & ~v10) + *(void *)(v9 + 40) + v12;
  (*(void (**)(unint64_t, unint64_t))(v11 + 24))(((unint64_t)a1 + v13) & ~v12, ((unint64_t)a2 + v13) & ~v12);
  return a1;
}

void *sub_D2BC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  unint64_t v6 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v7 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v6 = *v7;
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v9 = v8 + 32;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  (*(void (**)(unint64_t, unint64_t))(v8 + 32))(((unint64_t)v6 + v10 + 8) & ~v10, ((unint64_t)v7 + v10 + 8) & ~v10);
  uint64_t v11 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v12 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v13 = ((v10 + 16) & ~v10) + *(void *)(v9 + 32) + v12;
  (*(void (**)(unint64_t, unint64_t))(v11 + 32))(((unint64_t)a1 + v13) & ~v12, ((unint64_t)a2 + v13) & ~v12);
  return a1;
}

void *sub_D3B0(void *a1, void *a2, uint64_t a3)
{
  unint64_t v6 = (unint64_t)a2 + 15;
  *a1 = *a2;
  swift_release();
  uint64_t v7 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  v6 &= 0xFFFFFFFFFFFFFFF8;
  void *v7 = *(void *)v6;
  swift_release();
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v9 = v8 + 40;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  (*(void (**)(unint64_t, unint64_t))(v8 + 40))(((unint64_t)v7 + v10 + 8) & ~v10, (v10 + 8 + v6) & ~v10);
  uint64_t v11 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v12 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v13 = ((v10 + 16) & ~v10) + *(void *)(v9 + 24) + v12;
  (*(void (**)(unint64_t, unint64_t))(v11 + 40))(((unint64_t)a1 + v13) & ~v12, ((unint64_t)a2 + v13) & ~v12);
  return a1;
}

uint64_t sub_D4BC(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v6 = 0x7FFFFFFF;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v4 + 84);
  }
  uint64_t v7 = *(void *)(a3 + 24);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  uint64_t v10 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  if (v9 <= v6) {
    unsigned int v12 = v6;
  }
  else {
    unsigned int v12 = *(_DWORD *)(v8 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v13 = ((v10 + 16) & ~v10) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + v11;
  int v14 = a2 - v12;
  if (a2 <= v12) {
    goto LABEL_28;
  }
  uint64_t v15 = (v13 & ~v11) + *(void *)(*(void *)(v7 - 8) + 64);
  char v16 = 8 * v15;
  if (v15 <= 3)
  {
    unsigned int v19 = ((v14 + ~(-1 << v16)) >> v16) + 1;
    if (HIWORD(v19))
    {
      int v17 = *(_DWORD *)((char *)a1 + v15);
      if (!v17) {
        goto LABEL_28;
      }
      goto LABEL_18;
    }
    if (v19 > 0xFF)
    {
      int v17 = *(unsigned __int16 *)((char *)a1 + v15);
      if (!*(unsigned __int16 *)((char *)a1 + v15)) {
        goto LABEL_28;
      }
      goto LABEL_18;
    }
    if (v19 < 2)
    {
LABEL_28:
      if (v6 < v9) {
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v8 + 48))(((unint64_t)a1 + v13) & ~v11, v9, v7);
      }
      uint64_t v23 = (unint64_t *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
      if ((v5 & 0x80000000) != 0) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)v23 + v10 + 8) & ~v10);
      }
      unint64_t v24 = *v23;
      if (v24 >= 0xFFFFFFFF) {
        LODWORD(v24) = -1;
      }
      return (v24 + 1);
    }
  }
  int v17 = *((unsigned __int8 *)a1 + v15);
  if (!*((unsigned char *)a1 + v15)) {
    goto LABEL_28;
  }
LABEL_18:
  int v20 = (v17 - 1) << v16;
  if (v15 > 3) {
    int v20 = 0;
  }
  if (v15)
  {
    if (v15 <= 3) {
      int v21 = v15;
    }
    else {
      int v21 = 4;
    }
    switch(v21)
    {
      case 2:
        int v22 = *a1;
        break;
      case 3:
        int v22 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v22 = *(_DWORD *)a1;
        break;
      default:
        int v22 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v22 = 0;
  }
  return v12 + (v22 | v20) + 1;
}

void sub_D700(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(a4 + 24);
  uint64_t v10 = *(void *)(v9 - 8);
  unsigned int v11 = *(_DWORD *)(v10 + 84);
  uint64_t v12 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v13 = *(unsigned __int8 *)(v10 + 80);
  if (v11 <= v8) {
    unsigned int v14 = v8;
  }
  else {
    unsigned int v14 = *(_DWORD *)(v10 + 84);
  }
  size_t v15 = ((v12 + 16) & ~v12) + *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  size_t v16 = v15 + v13;
  size_t v17 = ((v15 + v13) & ~v13) + *(void *)(*(void *)(v9 - 8) + 64);
  BOOL v18 = a3 >= v14;
  unsigned int v19 = a3 - v14;
  if (v19 != 0 && v18)
  {
    if (v17 <= 3)
    {
      unsigned int v24 = ((v19 + ~(-1 << (8 * v17))) >> (8 * v17)) + 1;
      if (HIWORD(v24))
      {
        int v20 = 4;
      }
      else if (v24 >= 0x100)
      {
        int v20 = 2;
      }
      else
      {
        int v20 = v24 > 1;
      }
    }
    else
    {
      int v20 = 1;
    }
  }
  else
  {
    int v20 = 0;
  }
  if (v14 < a2)
  {
    unsigned int v21 = ~v14 + a2;
    if (v17 < 4)
    {
      int v22 = (v21 >> (8 * v17)) + 1;
      if (v17)
      {
        int v25 = v21 & ~(-1 << (8 * v17));
        bzero(a1, v17);
        if (v17 == 3)
        {
          *(_WORD *)a1 = v25;
          a1[2] = BYTE2(v25);
        }
        else if (v17 == 2)
        {
          *(_WORD *)a1 = v25;
        }
        else
        {
          *a1 = v25;
        }
      }
    }
    else
    {
      bzero(a1, v17);
      *(_DWORD *)a1 = v21;
      int v22 = 1;
    }
    switch(v20)
    {
      case 1:
        a1[v17] = v22;
        return;
      case 2:
        *(_WORD *)&a1[v17] = v22;
        return;
      case 3:
        goto LABEL_62;
      case 4:
        *(_DWORD *)&a1[v17] = v22;
        return;
      default:
        return;
    }
  }
  uint64_t v23 = ~v13;
  switch(v20)
  {
    case 1:
      a1[v17] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_27;
    case 2:
      *(_WORD *)&a1[v17] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_27;
    case 3:
LABEL_62:
      __break(1u);
      JUMPOUT(0xDAA8);
    case 4:
      *(_DWORD *)&a1[v17] = 0;
      goto LABEL_26;
    default:
LABEL_26:
      if (a2)
      {
LABEL_27:
        if (v8 >= v11)
        {
          if (v8 >= a2)
          {
            uint64_t v30 = (void *)((unint64_t)(a1 + 15) & 0xFFFFFFFFFFFFFFF8);
            if ((v7 & 0x80000000) != 0)
            {
              id v32 = *(void (**)(unint64_t))(v6 + 56);
              v32(((unint64_t)v30 + v12 + 8) & ~v12);
            }
            else
            {
              if ((a2 & 0x80000000) != 0) {
                uint64_t v31 = a2 ^ 0x80000000;
              }
              else {
                uint64_t v31 = a2 - 1;
              }
              void *v30 = v31;
            }
          }
          else
          {
            if (v15 <= 3) {
              int v27 = ~(-1 << (8 * v15));
            }
            else {
              int v27 = -1;
            }
            if (v15)
            {
              int v28 = v27 & (~v8 + a2);
              if (v15 <= 3) {
                int v29 = v15;
              }
              else {
                int v29 = 4;
              }
              bzero(a1, v15);
              switch(v29)
              {
                case 2:
                  *(_WORD *)a1 = v28;
                  break;
                case 3:
                  *(_WORD *)a1 = v28;
                  a1[2] = BYTE2(v28);
                  break;
                case 4:
                  *(_DWORD *)a1 = v28;
                  break;
                default:
                  *a1 = v28;
                  break;
              }
            }
          }
        }
        else
        {
          char v26 = *(void (**)(unint64_t))(v10 + 56);
          v26((unint64_t)&a1[v16] & v23);
        }
      }
      return;
  }
}

uint64_t type metadata accessor for PageIndex(uint64_t a1, uint64_t a2)
{
  return _swift_getGenericMetadata(a1, a2, &nominal type descriptor for PageIndex);
}

void *sub_DAF8()
{
  return &protocol witness table for Never;
}

uint64_t sub_DB04()
{
  return swift_getWitnessTable();
}

id sub_DB20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9 = [objc_allocWithZone((Class)UIPageControl) init];
  [v9 setBackgroundStyle:2];
  uint64_t v10 = self;
  id v11 = [v10 labelColor];
  [v9 setCurrentPageIndicatorTintColor:v11];

  id v12 = [v10 tertiaryLabelColor];
  [v9 setPageIndicatorTintColor:v12];

  v14[0] = a2;
  v14[1] = a3;
  v14[2] = a4;
  v14[3] = a5;
  type metadata accessor for PageIndex(255, (uint64_t)v14);
  swift_getWitnessTable();
  sub_331A0();
  sub_33190();
  [v9 addTarget:v14[0] action:"pageDidChange:" forControlEvents:4096];
  swift_release();
  return v9;
}

void *initializeBufferWithCopyOfBuffer for NewWallpaperItemPairView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for NewWallpaperItemPairView()
{
  return swift_release();
}

void *assignWithCopy for NewWallpaperItemPairView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  return a1;
}

void *assignWithTake for NewWallpaperItemPairView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for NewWallpaperItemPairView(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 16)) {
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

uint64_t storeEnumTagSinglePayload for NewWallpaperItemPairView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NewWallpaperItemPairView()
{
  return &type metadata for NewWallpaperItemPairView;
}

uint64_t sub_DE10()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_DE2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v57 = a3;
  uint64_t v5 = sub_32F70();
  uint64_t v55 = *(void *)(v5 - 8);
  uint64_t v56 = v5;
  __chkstk_darwin(v5);
  int v54 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_33180();
  uint64_t v47 = *(void *)(v7 - 8);
  uint64_t v48 = v7;
  __chkstk_darwin(v7);
  id v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_5CC8(&qword_485A8);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_5CC8(&qword_454C8);
  uint64_t v14 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  size_t v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_5CC8(&qword_454D0);
  uint64_t v17 = __chkstk_darwin(v51);
  uint64_t v53 = (uint64_t)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v17);
  unsigned int v21 = (char *)&v45 - v20;
  uint64_t v22 = __chkstk_darwin(v19);
  uint64_t v50 = (char *)&v45 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v49 = (char *)&v45 - v25;
  __chkstk_darwin(v24);
  uint64_t v52 = (uint64_t)&v45 - v26;
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = a1;
  *(void *)(v27 + 24) = a2;
  sub_E5E0();
  swift_retain();
  sub_334C0();
  sub_33170();
  uint64_t v28 = sub_E818(&qword_485B8, &qword_485A8);
  sub_333F0();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v9, v48);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v58 = v10;
  uint64_t v59 = v28;
  swift_getOpaqueTypeConformance2();
  uint64_t v29 = v46;
  sub_33380();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v29);
  sub_32F30();
  if (qword_48330 != -1) {
    swift_once();
  }
  id v30 = (id)qword_4A3D0;
  uint64_t v31 = sub_33300();
  uint64_t v33 = v32;
  char v35 = v34 & 1;
  uint64_t v36 = (uint64_t)v50;
  sub_32C90();
  sub_8C94(v31, v33, v35);
  swift_bridgeObjectRelease();
  sub_E634((uint64_t)v21);
  uint64_t v37 = v54;
  sub_32F60();
  char v38 = v49;
  sub_32CB0();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v37, v56);
  sub_E634(v36);
  uint64_t v39 = (uint64_t)v38;
  uint64_t v40 = v52;
  sub_E694(v39, v52);
  uint64_t v41 = v53;
  sub_E6FC(v40, v53);
  uint64_t v42 = v57;
  sub_E6FC(v41, v57);
  uint64_t v43 = v42 + *(int *)(sub_5CC8(&qword_454D8) + 48);
  *(void *)uint64_t v43 = sub_7AD4;
  *(void *)(v43 + 8) = 0;
  *(unsigned char *)(v43 + 16) = 0;
  sub_7B54();
  sub_E634(v40);
  sub_7B6C();
  return sub_E634(v41);
}

uint64_t sub_E458(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = *(void (**)(uint64_t))(result
                                        + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_addNewWallpaperAction);
    if (v1)
    {
      *(unsigned char *)(result
               + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_enqueueSnapshotUpdates) = 1;
      swift_retain();
      uint64_t v2 = sub_E7BC((uint64_t)v1);
      v1(v2);
      sub_E7CC((uint64_t)v1);
      return swift_release();
    }
  }
  else
  {
    type metadata accessor for PosterConfigurationCarouselViewModel();
    sub_E764();
    uint64_t result = sub_32D80();
    __break(1u);
  }
  return result;
}

void sub_E528(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_7AD4;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
}

uint64_t sub_E544@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  *(void *)a1 = sub_32F20();
  *(void *)(a1 + 8) = 0x4020000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v5 = sub_5CC8(&qword_454C0);
  return sub_DE2C(v4, v3, a1 + *(int *)(v5 + 44));
}

uint64_t sub_E5A0()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_E5D8()
{
  return sub_E458(*(void *)(v0 + 16));
}

unint64_t sub_E5E0()
{
  unint64_t result = qword_485B0;
  if (!qword_485B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_485B0);
  }
  return result;
}

uint64_t sub_E634(uint64_t a1)
{
  uint64_t v2 = sub_5CC8(&qword_454D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_E694(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5CC8(&qword_454D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_E6FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5CC8(&qword_454D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_E764()
{
  unint64_t result = qword_483B8;
  if (!qword_483B8)
  {
    type metadata accessor for PosterConfigurationCarouselViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_483B8);
  }
  return result;
}

uint64_t sub_E7BC(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_E7CC(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_E7DC()
{
  return sub_E818(&qword_454E0, &qword_454E8);
}

uint64_t sub_E818(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_6E48(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for FindClass()
{
  return self;
}

id sub_E8C4()
{
  type metadata accessor for FindClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_4A3D0 = (uint64_t)result;
  return result;
}

ValueMetadata *type metadata accessor for AddNewWallpaperButton()
{
  return &type metadata for AddNewWallpaperButton;
}

uint64_t sub_E92C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_E948@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v63 = a2;
  uint64_t v75 = a3;
  uint64_t v4 = sub_32AF0();
  uint64_t v73 = *(void *)(v4 - 8);
  uint64_t v74 = v4;
  __chkstk_darwin(v4);
  os_log_type_t v72 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_32D60();
  uint64_t v68 = *(void *)(v6 - 8);
  uint64_t v69 = v6;
  __chkstk_darwin(v6);
  unint64_t v67 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_331C0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v65 = v8;
  uint64_t v66 = v9;
  __chkstk_darwin(v8);
  uint64_t v60 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_5CC8(&qword_485E8);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_5CC8(&qword_485F0);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_5CC8(&qword_485F8);
  uint64_t v62 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v19 = (char *)&v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_5CC8(&qword_48600);
  uint64_t v21 = v20 - 8;
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v58 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_5CC8(&qword_48608);
  __chkstk_darwin(v59);
  uint64_t v61 = (char *)&v58 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_5CC8(&qword_48610);
  __chkstk_darwin(v71);
  uint64_t v70 = (char *)&v58 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = swift_allocObject();
  uint64_t v27 = v63;
  *(void *)(v26 + 16) = a1;
  *(void *)(v26 + 24) = v27;
  uint64_t v76 = a1;
  uint64_t v77 = v27;
  swift_retain();
  sub_5CC8(&qword_48618);
  sub_F620();
  sub_334C0();
  uint64_t v28 = sub_33420();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v17, v14, v11);
  id v30 = (uint64_t *)&v17[*(int *)(v15 + 36)];
  uint64_t *v30 = KeyPath;
  v30[1] = v28;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v31 = v60;
  sub_331B0();
  sub_F784();
  sub_FC30(&qword_48668, (void (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle);
  uint64_t v32 = v65;
  sub_33370();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v31, v32);
  sub_6D44((uint64_t)v17, &qword_485F0);
  uint64_t v33 = v67;
  sub_32D50();
  uint64_t v34 = swift_getKeyPath();
  uint64_t v35 = *(int *)(v21 + 44);
  uint64_t v36 = v59;
  uint64_t v37 = (uint64_t *)&v23[v35];
  uint64_t v38 = sub_5CC8(&qword_48670);
  uint64_t v40 = v68;
  uint64_t v39 = v69;
  (*(void (**)(char *, char *, uint64_t))(v68 + 16))((char *)v37 + *(int *)(v38 + 28), v33, v69);
  uint64_t *v37 = v34;
  uint64_t v41 = v62;
  uint64_t v42 = v64;
  (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v23, v19, v64);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v33, v39);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v19, v42);
  uint64_t v43 = (uint64_t)v61;
  uint64_t v45 = v72;
  uint64_t v44 = v73;
  uint64_t v46 = v74;
  (*(void (**)(char *, void, uint64_t))(v73 + 104))(v72, enum case for ControlSize.small(_:), v74);
  uint64_t v47 = swift_getKeyPath();
  uint64_t v48 = (uint64_t *)(v43 + *(int *)(v36 + 36));
  uint64_t v49 = sub_5CC8(&qword_48678);
  (*(void (**)(char *, char *, uint64_t))(v44 + 16))((char *)v48 + *(int *)(v49 + 28), v45, v46);
  uint64_t *v48 = v47;
  sub_FB0C((uint64_t)v23, v43, &qword_48600);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v46);
  sub_6D44((uint64_t)v23, &qword_48600);
  sub_32F30();
  if (qword_48330 != -1) {
    swift_once();
  }
  id v50 = (id)qword_4A3D0;
  uint64_t v51 = sub_33300();
  uint64_t v53 = v52;
  char v55 = v54 & 1;
  sub_F858();
  uint64_t v56 = (uint64_t)v70;
  sub_333C0();
  sub_8C94(v51, v53, v55);
  swift_bridgeObjectRelease();
  sub_6D44(v43, &qword_48608);
  sub_32C70();
  return sub_6D44(v56, &qword_48610);
}

uint64_t sub_F174(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = *(void (**)(uint64_t))(result
                                        + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_addNewWallpaperAction);
    if (v1)
    {
      *(unsigned char *)(result
               + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_enqueueSnapshotUpdates) = 1;
      swift_retain();
      uint64_t v2 = sub_E7BC((uint64_t)v1);
      v1(v2);
      sub_E7CC((uint64_t)v1);
      return swift_release();
    }
  }
  else
  {
    type metadata accessor for PosterConfigurationCarouselViewModel();
    sub_FC30((unint64_t *)&qword_483B8, (void (*)(uint64_t))type metadata accessor for PosterConfigurationCarouselViewModel);
    id result = sub_32D80();
    __break(1u);
  }
  return result;
}

uint64_t sub_F274@<X0>(uint64_t a1@<X8>)
{
  uint64_t v41 = a1;
  uint64_t v37 = sub_5CC8(&qword_48640);
  __chkstk_darwin(v37);
  uint64_t v40 = (uint64_t *)((char *)&v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v39 = sub_334A0();
  uint64_t v35 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  uint64_t v38 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_33480();
  uint64_t v3 = sub_33310();
  uint64_t v34 = v4;
  char v6 = v5;
  uint64_t v36 = v7;
  sub_32F30();
  if (qword_48330 != -1) {
    swift_once();
  }
  char v8 = v6 & 1;
  id v9 = (id)qword_4A3D0;
  uint64_t v10 = sub_33300();
  uint64_t v12 = v11;
  char v14 = v13 & 1;
  uint64_t v15 = v34;
  uint64_t v16 = sub_332C0();
  uint64_t v32 = v17;
  uint64_t v33 = v18;
  char v20 = v19 & 1;
  sub_8C94(v10, v12, v14);
  swift_bridgeObjectRelease();
  sub_8C94(v3, v15, v8);
  swift_bridgeObjectRelease();
  uint64_t v21 = v35;
  uint64_t v23 = v38;
  uint64_t v22 = v39;
  (*(void (**)(char *, void, uint64_t))(v35 + 104))(v38, enum case for Image.Scale.small(_:), v39);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v25 = v40;
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))((char *)v40 + *(int *)(v37 + 28), v23, v22);
  *uint64_t v25 = KeyPath;
  uint64_t v26 = sub_5CC8(&qword_48618);
  uint64_t v27 = v41;
  sub_FB0C((uint64_t)v25, v41 + *(int *)(v26 + 36), &qword_48640);
  uint64_t v28 = v32;
  uint64_t v29 = v33;
  *(void *)uint64_t v27 = v16;
  *(void *)(v27 + 8) = v28;
  *(unsigned char *)(v27 + 16) = v20;
  *(void *)(v27 + 24) = v29;
  uint64_t v30 = v28;
  sub_FB70(v16, v28, v20);
  swift_bridgeObjectRetain();
  sub_6D44((uint64_t)v25, &qword_48640);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v22);
  sub_8C94(v16, v30, v20);
  return swift_bridgeObjectRelease();
}

uint64_t sub_F5D0@<X0>(uint64_t a1@<X8>)
{
  return sub_E948(*v1, v1[1], a1);
}

uint64_t sub_F5D8()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_F610()
{
  return sub_F174(*(void *)(v0 + 16));
}

uint64_t sub_F618@<X0>(uint64_t a1@<X8>)
{
  return sub_F274(a1);
}

unint64_t sub_F620()
{
  unint64_t result = qword_48620;
  if (!qword_48620)
  {
    sub_6E48(&qword_48618);
    sub_F6C0();
    sub_E818(&qword_48638, &qword_48640);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48620);
  }
  return result;
}

unint64_t sub_F6C0()
{
  unint64_t result = qword_48628;
  if (!qword_48628)
  {
    sub_6E48(&qword_48630);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48628);
  }
  return result;
}

uint64_t sub_F72C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_32EB0();
  *a1 = result;
  return result;
}

uint64_t sub_F758()
{
  return sub_32EC0();
}

unint64_t sub_F784()
{
  unint64_t result = qword_48648;
  if (!qword_48648)
  {
    sub_6E48(&qword_485F0);
    sub_E818(&qword_48650, &qword_485E8);
    sub_E818(&qword_48658, &qword_48660);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48648);
  }
  return result;
}

unint64_t sub_F858()
{
  unint64_t result = qword_48680;
  if (!qword_48680)
  {
    sub_6E48(&qword_48608);
    sub_F8F8();
    sub_E818(&qword_48698, &qword_48678);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48680);
  }
  return result;
}

unint64_t sub_F8F8()
{
  unint64_t result = qword_48688;
  if (!qword_48688)
  {
    sub_6E48(&qword_48600);
    sub_6E48(&qword_485F0);
    sub_331C0();
    sub_F784();
    sub_FC30(&qword_48668, (void (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle);
    swift_getOpaqueTypeConformance2();
    sub_E818(&qword_48690, &qword_48670);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48688);
  }
  return result;
}

uint64_t sub_FA1C()
{
  return sub_32DB0();
}

uint64_t sub_FA40(uint64_t a1)
{
  uint64_t v2 = sub_334A0();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_32DC0();
}

uint64_t sub_FB0C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_5CC8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_FB70(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

unint64_t sub_FB84()
{
  unint64_t result = qword_486A0;
  if (!qword_486A0)
  {
    sub_6E48(&qword_48610);
    sub_F858();
    sub_FC30(&qword_452F8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_486A0);
  }
  return result;
}

uint64_t sub_FC30(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t PRSPosterConfiguration.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_328E0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_5CC8((uint64_t *)&unk_48440);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = [v2 serverUUID];
  if (v11)
  {
    uint64_t v12 = v11;
    sub_328D0();

    char v13 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    v13(v10, v7, v4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v10, 0, 1, v4);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4);
    if (result != 1) {
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v13)(a1, v10, v4);
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, 1, 1, v4);
  }
  __break(1u);
  return result;
}

unint64_t sub_FE4C()
{
  unint64_t result = qword_454F0;
  if (!qword_454F0)
  {
    sub_328E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_454F0);
  }
  return result;
}

id sub_FEA4()
{
  id result = [objc_allocWithZone((Class)PRSService) init];
  qword_4A3D8 = (uint64_t)result;
  return result;
}

uint64_t sub_FED8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_328E0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_5CC8((uint64_t *)&unk_48440);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = [*v1 serverUUID];
  if (v10)
  {
    id v11 = v10;
    sub_328D0();

    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
    v12(v9, v6, v3);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v9, 0, 1, v3);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3);
    if (result != 1) {
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v12)(a1, v9, v3);
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v9, 1, 1, v3);
  }
  __break(1u);
  return result;
}

void *destroy for CustomizeWallpaperButton(void *result)
{
  if (*result) {
    return (void *)swift_release();
  }
  return result;
}

void *_s17WallpaperSettings24CustomizeWallpaperButtonVwCP_0(void *a1, void *a2)
{
  if (*a2)
  {
    uint64_t v3 = a2[1];
    *a1 = *a2;
    a1[1] = v3;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  return a1;
}

void *assignWithCopy for CustomizeWallpaperButton(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (!*a1)
  {
    if (v4)
    {
      uint64_t v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for CustomizeWallpaperButton(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (!*a1)
  {
    if (v4)
    {
      uint64_t v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for CustomizeWallpaperButton()
{
  return &type metadata for CustomizeWallpaperButton;
}

uint64_t sub_101F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10210@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v66 = a2;
  uint64_t v71 = a3;
  uint64_t v4 = sub_33570();
  __chkstk_darwin(v4 - 8);
  uint64_t v69 = (char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_335B0();
  uint64_t v68 = *(void *)(v70 - 8);
  __chkstk_darwin(v70);
  unint64_t v67 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_5CC8(&qword_454F8);
  uint64_t v7 = *(void *)(v65 - 8);
  __chkstk_darwin(v65);
  uint64_t v9 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_5CC8(&qword_45500);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  char v13 = (char *)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_5CC8(&qword_45508);
  uint64_t v15 = v14 - 8;
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_5CC8(&qword_45510);
  uint64_t v19 = v18 - 8;
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v64 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = swift_allocObject();
  uint64_t v23 = v66;
  *(void *)(v22 + 16) = a1;
  *(void *)(v22 + 24) = v23;
  sub_E7BC(a1);
  sub_5CC8(&qword_45518);
  sub_10CA0();
  sub_334C0();
  char v24 = sub_33230();
  sub_32AC0();
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v33 = v65;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v9, v65);
  uint64_t v34 = &v13[*(int *)(v11 + 44)];
  *uint64_t v34 = v24;
  *((void *)v34 + 1) = v26;
  *((void *)v34 + 2) = v28;
  *((void *)v34 + 3) = v30;
  *((void *)v34 + 4) = v32;
  v34[40] = 0;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v33);
  char v35 = sub_33210();
  sub_32AC0();
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  sub_FB0C((uint64_t)v13, (uint64_t)v17, &qword_45500);
  uint64_t v44 = &v17[*(int *)(v15 + 44)];
  *uint64_t v44 = v35;
  *((void *)v44 + 1) = v37;
  *((void *)v44 + 2) = v39;
  *((void *)v44 + 3) = v41;
  *((void *)v44 + 4) = v43;
  v44[40] = 0;
  sub_6D44((uint64_t)v13, &qword_45500);
  uint64_t v45 = v67;
  sub_335A0();
  uint64_t v46 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v47 = sub_32F40();
  uint64_t v48 = (uint64_t)v69;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v47 - 8) + 104))(v69, v46, v47);
  uint64_t v49 = &v21[*(int *)(v19 + 44)];
  uint64_t v50 = v68;
  uint64_t v51 = v70;
  (*(void (**)(char *, char *, uint64_t))(v68 + 16))(v49, v45, v70);
  uint64_t v52 = sub_5CC8(&qword_486B8);
  sub_10E10(v48, (uint64_t)&v49[*(int *)(v52 + 52)]);
  *(_WORD *)&v49[*(int *)(v52 + 56)] = 256;
  sub_FB0C((uint64_t)v17, (uint64_t)v21, &qword_45508);
  sub_10E74(v48);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v45, v51);
  sub_6D44((uint64_t)v17, &qword_45508);
  LOBYTE(v49) = sub_33220();
  sub_32AC0();
  uint64_t v54 = v53;
  uint64_t v56 = v55;
  uint64_t v58 = v57;
  uint64_t v60 = v59;
  uint64_t v61 = v71;
  sub_FB0C((uint64_t)v21, v71, &qword_45510);
  uint64_t v62 = v61 + *(int *)(sub_5CC8(&qword_45538) + 36);
  *(unsigned char *)uint64_t v62 = (_BYTE)v49;
  *(void *)(v62 + 8) = v54;
  *(void *)(v62 + 16) = v56;
  *(void *)(v62 + 24) = v58;
  *(void *)(v62 + 32) = v60;
  *(unsigned char *)(v62 + 40) = 0;
  return sub_6D44((uint64_t)v21, &qword_45510);
}

uint64_t sub_10764(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = (void (*)(uint64_t))result;
    uint64_t v2 = swift_retain();
    v1(v2);
    return sub_E7CC((uint64_t)v1);
  }
  return result;
}

uint64_t sub_107B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v28 = a1;
  uint64_t v1 = sub_5CC8(&qword_486C0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_5CC8(&qword_45540);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_5CC8(&qword_45530);
  __chkstk_darwin(v27);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_32F30();
  if (qword_48330 != -1) {
    swift_once();
  }
  id v10 = (id)qword_4A3D0;
  uint64_t v11 = sub_33300();
  uint64_t v13 = v12;
  uint64_t v29 = v11;
  uint64_t v30 = v12;
  char v15 = v14 & 1;
  char v31 = v14 & 1;
  uint64_t v32 = v16;
  sub_333B0();
  sub_8C94(v11, v13, v15);
  swift_bridgeObjectRelease();
  uint64_t v17 = sub_33260();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v3, 1, 1, v17);
  uint64_t v18 = sub_33280();
  sub_6D44((uint64_t)v3, &qword_486C0);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v9, v7, v4);
  uint64_t v20 = (uint64_t *)&v9[*(int *)(v27 + 36)];
  *uint64_t v20 = KeyPath;
  v20[1] = v18;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v21 = sub_33440();
  uint64_t v22 = swift_getKeyPath();
  uint64_t v23 = v28;
  sub_FB0C((uint64_t)v9, v28, &qword_45530);
  char v24 = (uint64_t *)(v23 + *(int *)(sub_5CC8(&qword_45518) + 36));
  uint64_t *v24 = v22;
  v24[1] = v21;
  return sub_6D44((uint64_t)v9, &qword_45530);
}

uint64_t sub_10B24()
{
  uint64_t v0 = sub_32AE0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for ColorScheme.dark(_:), v0);
  char v4 = sub_32AD0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v4) {
    return 0x6B7261446B636F64;
  }
  else {
    return 0x6867694C6B636F64;
  }
}

uint64_t sub_10C50@<X0>(uint64_t a1@<X8>)
{
  return sub_10210(*v1, v1[1], a1);
}

uint64_t sub_10C58()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return swift_deallocObject();
}

uint64_t sub_10C98()
{
  return sub_10764(*(void *)(v0 + 16));
}

unint64_t sub_10CA0()
{
  unint64_t result = qword_45520;
  if (!qword_45520)
  {
    sub_6E48(&qword_45518);
    sub_10D40();
    sub_E818(&qword_48658, &qword_48660);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_45520);
  }
  return result;
}

unint64_t sub_10D40()
{
  unint64_t result = qword_45528;
  if (!qword_45528)
  {
    sub_6E48(&qword_45530);
    swift_getOpaqueTypeConformance2();
    sub_E818(&qword_486A8, &qword_486B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_45528);
  }
  return result;
}

uint64_t sub_10E10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_33570();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10E74(uint64_t a1)
{
  uint64_t v2 = sub_33570();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10EE0()
{
  return sub_10FE0(&qword_45548, &qword_45538, (void (*)(void))sub_10F1C);
}

unint64_t sub_10F1C()
{
  unint64_t result = qword_45550;
  if (!qword_45550)
  {
    sub_6E48(&qword_45510);
    sub_10FE0(&qword_45558, &qword_45508, (void (*)(void))sub_11060);
    sub_E818(&qword_486C8, &qword_486B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_45550);
  }
  return result;
}

uint64_t sub_10FE0(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_6E48(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_11060()
{
  unint64_t result = qword_45560;
  if (!qword_45560)
  {
    sub_6E48(&qword_45500);
    sub_E818(&qword_45568, &qword_454F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_45560);
  }
  return result;
}

void *sub_11100(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_5CC8(&qword_486D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_32C60();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    uint64_t v11 = (void *)((char *)a1 + v9);
    uint64_t v12 = (void *)((char *)a2 + v9);
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    *uint64_t v11 = v13;
    v11[1] = v14;
    char v15 = (char *)a1 + v10;
    uint64_t v16 = *(void *)((char *)a2 + v10);
    uint64_t v17 = *(void *)((char *)a2 + v10 + 8);
    char v18 = *((unsigned char *)a2 + v10 + 16);
    swift_retain();
    sub_7870(v16, v17, v18);
    *(void *)char v15 = v16;
    *((void *)v15 + 1) = v17;
    v15[16] = v18;
    uint64_t v19 = a3[8];
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    *(_OWORD *)((char *)a1 + v19) = *(_OWORD *)((char *)a2 + v19);
  }
  return a1;
}

uint64_t sub_11274(uint64_t a1, uint64_t a2)
{
  sub_5CC8(&qword_486D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_32C60();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = *(void *)v5;
  uint64_t v7 = *(void *)(v5 + 8);
  char v8 = *(unsigned char *)(v5 + 16);

  return sub_787C(v6, v7, v8);
}

void *sub_11328(void *a1, void *a2, int *a3)
{
  sub_5CC8(&qword_486D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_32C60();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)((char *)a1 + v7);
  uint64_t v10 = (void *)((char *)a2 + v7);
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  void *v9 = v11;
  v9[1] = v12;
  uint64_t v13 = (char *)a1 + v8;
  uint64_t v14 = *(void *)((char *)a2 + v8);
  uint64_t v15 = *(void *)((char *)a2 + v8 + 8);
  char v16 = *((unsigned char *)a2 + v8 + 16);
  swift_retain();
  sub_7870(v14, v15, v16);
  *(void *)uint64_t v13 = v14;
  *((void *)v13 + 1) = v15;
  v13[16] = v16;
  uint64_t v17 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(_OWORD *)((char *)a1 + v17) = *(_OWORD *)((char *)a2 + v17);
  return a1;
}

void *sub_1144C(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_6D44((uint64_t)a1, &qword_486D0);
    sub_5CC8(&qword_486D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_32C60();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  *(void *)((char *)a1 + v7) = *(void *)((char *)a2 + v7);
  swift_retain();
  swift_release();
  *((void *)v8 + 1) = *((void *)v9 + 1);
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = *(void *)v12;
  uint64_t v14 = *((void *)v12 + 1);
  LOBYTE(v9) = v12[16];
  sub_7870(*(void *)v12, v14, (char)v9);
  uint64_t v15 = *(void *)v11;
  uint64_t v16 = *((void *)v11 + 1);
  char v17 = v11[16];
  *(void *)uint64_t v11 = v13;
  *((void *)v11 + 1) = v14;
  v11[16] = (char)v9;
  sub_787C(v15, v16, v17);
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  uint64_t v18 = a3[8];
  uint64_t v19 = (void *)((char *)a1 + v18);
  uint64_t v20 = (void *)((char *)a2 + v18);
  *uint64_t v19 = *v20;
  v19[1] = v20[1];
  return a1;
}

char *sub_115C0(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_5CC8(&qword_486D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_32C60();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  v9[16] = v10[16];
  uint64_t v11 = a3[8];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  *(_OWORD *)&a1[v11] = *(_OWORD *)&a2[v11];
  return a1;
}

char *sub_116C0(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_6D44((uint64_t)a1, &qword_486D0);
    uint64_t v6 = sub_5CC8(&qword_486D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_32C60();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  swift_release();
  *((void *)v9 + 1) = *((void *)v10 + 1);
  uint64_t v11 = a3[6];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  char v14 = v13[16];
  uint64_t v15 = *(void *)v12;
  uint64_t v16 = *((void *)v12 + 1);
  char v17 = v12[16];
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  v12[16] = v14;
  sub_787C(v15, v16, v17);
  uint64_t v18 = a3[8];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  *(_OWORD *)&a1[v18] = *(_OWORD *)&a2[v18];
  return a1;
}

uint64_t sub_11808(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1181C);
}

uint64_t sub_1181C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_5CC8(&qword_45570);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_118EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_11900);
}

uint64_t sub_11900(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_5CC8(&qword_45570);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
  return result;
}

uint64_t type metadata accessor for WallpaperConfigurationsCarouselContent()
{
  uint64_t result = qword_48730;
  if (!qword_48730) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_11A0C()
{
  sub_11AC4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_11AC4()
{
  if (!qword_48740)
  {
    sub_32C60();
    unint64_t v0 = sub_32B00();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_48740);
    }
  }
}

uint64_t sub_11B1C()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_11B38(uint64_t a1, double a2)
{
  id v4 = [self mainScreen];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  double v9 = *(double *)(a1 + *(int *)(type metadata accessor for WallpaperConfigurationsCarouselContent() + 28)) * -1.6;
  return v8 / v6 * ((a2 + v9 + v9 + -8.0) * 0.5);
}

double sub_11BE4@<D0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for WallpaperConfigurationsCarouselContent();
  uint64_t v5 = v4 - 8;
  uint64_t v6 = *(void *)(v4 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v4);
  double v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_32BB0();
  uint64_t v9 = *(int *)(v5 + 32);
  double v10 = *(double *)(a1 + *(int *)(v5 + 36)) * 1.6;
  double v12 = v11 - (v10 + v10);
  uint64_t v13 = *(void *)(a1 + v9);
  uint64_t v14 = *(void *)(a1 + v9 + 8);
  char v15 = *(unsigned char *)(a1 + v9 + 16);
  sub_7870(v13, v14, v15);
  double v16 = sub_13CD0(v13, v14, v15);
  double v18 = v17;
  sub_787C(v13, v14, v15);
  sub_13B10(a1, (uint64_t)v8);
  unint64_t v19 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v20 = (v7 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v21 = swift_allocObject();
  *(double *)(v21 + 16) = v12;
  sub_13B78((uint64_t)v8, v21 + v19);
  *(double *)(v21 + v20) = (v12 + -8.0) * 0.5 * (v18 / v16);
  *(double *)(v21 + ((v20 + 15) & 0xFFFFFFFFFFFFFFF8)) = v10;
  sub_335D0();
  sub_32B60();
  uint64_t v22 = v27;
  char v23 = v28;
  uint64_t v24 = v29;
  char v25 = v30;
  *(void *)a2 = sub_14034;
  *(void *)(a2 + 8) = v21;
  *(void *)(a2 + 16) = v22;
  *(unsigned char *)(a2 + 24) = v23;
  *(void *)(a2 + 32) = v24;
  *(unsigned char *)(a2 + 40) = v25;
  double result = *(double *)&v31;
  *(_OWORD *)(a2 + 48) = v31;
  return result;
}

uint64_t sub_11DEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>)
{
  uint64_t v40 = a3;
  uint64_t v11 = sub_33160();
  uint64_t v38 = *(void *)(v11 - 8);
  uint64_t v39 = v11;
  __chkstk_darwin(v11);
  uint64_t v33 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_330C0();
  __chkstk_darwin(v13 - 8);
  uint64_t v14 = sub_5CC8(&qword_45578);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  double v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_5CC8(&qword_45580);
  uint64_t v35 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  unint64_t v19 = (char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_5CC8(&qword_45588);
  uint64_t v20 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v22 = (char *)&v33 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_5CC8(&qword_45590);
  __chkstk_darwin(v34);
  uint64_t v24 = (char *)&v33 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_330B0();
  double v41 = a4;
  uint64_t v42 = a2;
  double v43 = a5;
  double v44 = a6;
  uint64_t v45 = a1;
  sub_5CC8(&qword_45598);
  sub_E818(&qword_455A0, &qword_45598);
  sub_32CF0();
  sub_33210();
  uint64_t v25 = sub_E818(&qword_455A8, &qword_45578);
  sub_33400();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  uint64_t v26 = v33;
  sub_33150();
  LOBYTE(a1) = sub_33200();
  unsigned __int8 v27 = sub_331E0();
  sub_331F0();
  sub_331F0();
  if (sub_331F0() != a1) {
    sub_331F0();
  }
  sub_331F0();
  if (sub_331F0() != v27) {
    sub_331F0();
  }
  *(void *)&long long v46 = v14;
  *((void *)&v46 + 1) = v25;
  swift_getOpaqueTypeConformance2();
  uint64_t v28 = v36;
  sub_333A0();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v26, v39);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v19, v28);
  sub_335D0();
  sub_32B60();
  uint64_t v29 = v37;
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v24, v22, v37);
  char v30 = &v24[*(int *)(v34 + 36)];
  long long v31 = v47;
  *(_OWORD *)char v30 = v46;
  *((_OWORD *)v30 + 1) = v31;
  *((_OWORD *)v30 + 2) = v48;
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v29);
  return sub_15198((uint64_t)v24, v40, &qword_45590);
}

uint64_t sub_12360(uint64_t a1, uint64_t a2, double a3, double a4, double a5)
{
  uint64_t v10 = sub_32CE0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for WallpaperConfigurationsCarouselContent();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  __chkstk_darwin(v14 - 8);
  double v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_13B10(a1, (uint64_t)v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a2, v10);
  unint64_t v18 = (*(unsigned __int8 *)(v15 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v19 = (v16 + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v20 = (v19 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (*(unsigned __int8 *)(v11 + 80) + v20 + 8) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v22 = swift_allocObject();
  *(double *)(v22 + 16) = a3;
  sub_13B78((uint64_t)v17, v22 + v18);
  *(double *)(v22 + v19) = a4;
  *(double *)(v22 + v20) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v22 + v21, v13, v10);
  sub_5CC8(&qword_455B0);
  uint64_t v23 = sub_6E48(&qword_455B8);
  uint64_t v24 = sub_6E48(&qword_455C0);
  unint64_t v25 = sub_143DC();
  unint64_t v26 = sub_144A0();
  uint64_t v29 = v24;
  char v30 = &type metadata for CarouselViewModelSnapshot;
  unint64_t v31 = v25;
  uint64_t v32 = (void *)v26;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v29 = v23;
  char v30 = (ValueMetadata *)&type metadata for Bool;
  unint64_t v31 = OpaqueTypeConformance2;
  uint64_t v32 = &protocol witness table for Bool;
  swift_getOpaqueTypeConformance2();
  return sub_33100();
}

uint64_t sub_12620@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>)
{
  uint64_t v75 = a3;
  uint64_t v91 = a1;
  uint64_t v85 = a4;
  uint64_t v80 = sub_32CE0();
  uint64_t v78 = *(void *)(v80 - 8);
  __chkstk_darwin(v80);
  uint64_t v74 = v11;
  uint64_t v76 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_32D30();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v87 = *(void *)(v13 + 64);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = v15;
  uint64_t v16 = type metadata accessor for WallpaperConfigurationsCarouselContent();
  uint64_t v90 = *(char **)(v16 - 8);
  uint64_t v17 = *((void *)v90 + 8);
  uint64_t v62 = v16 - 8;
  __chkstk_darwin(v16 - 8);
  unint64_t v18 = (char *)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_5CC8(&qword_455D8);
  uint64_t v67 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  uint64_t v61 = (char *)&v60 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = sub_5CC8(&qword_455C0);
  __chkstk_darwin(v89);
  v88 = (char *)&v60 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = sub_5CC8(&qword_455B8);
  uint64_t v83 = *(void *)(v84 - 8);
  __chkstk_darwin(v84);
  v81 = (char *)&v60 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_5CC8(&qword_455B0);
  uint64_t v79 = *(void *)(v82 - 8);
  __chkstk_darwin(v82);
  uint64_t v77 = (char *)&v60 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_32F20();
  uint64_t v23 = a2;
  uint64_t v92 = a2;
  double v93 = a5;
  double v94 = a6;
  sub_5CC8(&qword_455E8);
  sub_14500();
  sub_32FC0();
  sub_13B10(a2, (uint64_t)v18);
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  unint64_t v25 = v15;
  uint64_t v26 = v12;
  uint64_t v66 = v13 + 16;
  uint64_t v65 = v24;
  v24(v25, v91, v12);
  uint64_t v27 = v90[80];
  uint64_t v28 = (v27 + 16) & ~v27;
  uint64_t v72 = v17;
  uint64_t v86 = v27;
  uint64_t v70 = v28 + v17;
  unint64_t v29 = (v28 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v30 = (v29 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v31 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v32 = (v31 + v30 + 8) & ~v31;
  uint64_t v69 = v27 | 7;
  uint64_t v33 = swift_allocObject();
  uint64_t v71 = v28;
  uint64_t v90 = v18;
  sub_13B78((uint64_t)v18, v33 + v28);
  *(double *)(v33 + v29) = a7;
  *(double *)(v33 + v30) = a5;
  uint64_t v34 = *(void (**)(uint64_t, char *, uint64_t))(v13 + 32);
  uint64_t v35 = v60;
  uint64_t v36 = v26;
  uint64_t v73 = v13 + 32;
  uint64_t v64 = v34;
  ((void (*)(uint64_t))v34)(v33 + v32);
  uint64_t v37 = v67;
  uint64_t v38 = v88;
  uint64_t v39 = v61;
  uint64_t v40 = v68;
  (*(void (**)(char *, char *, uint64_t))(v67 + 16))(v88, v61, v68);
  double v41 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>))&v38[*(int *)(v89 + 36)];
  *double v41 = sub_14818;
  v41[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v33;
  (*(void (**)(char *, uint64_t))(v37 + 8))(v39, v40);
  if (*(void *)(v23 + *(int *)(v62 + 28)))
  {
    uint64_t v68 = ~v86;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_32A70();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v42 = v36;
    v65(v35, v91, v36);
    uint64_t v63 = v23;
    sub_13B10(v23, (uint64_t)v90);
    uint64_t v43 = v78;
    double v44 = v76;
    uint64_t v45 = v80;
    (*(void (**)(char *, uint64_t, uint64_t))(v78 + 16))(v76, v75, v80);
    uint64_t v46 = (v31 + 16) & ~v31;
    uint64_t v47 = (v87 + v86 + v46) & v68;
    unint64_t v48 = (v47 + v72 + *(unsigned __int8 *)(v43 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
    uint64_t v49 = swift_allocObject();
    v64(v49 + v46, v35, v42);
    uint64_t v50 = (uint64_t)v90;
    sub_13B78((uint64_t)v90, v49 + v47);
    (*(void (**)(unint64_t, char *, uint64_t))(v43 + 32))(v49 + v48, v44, v45);
    unint64_t v51 = sub_143DC();
    unint64_t v52 = sub_144A0();
    uint64_t v53 = v81;
    uint64_t v54 = (uint64_t)v88;
    uint64_t v55 = (void *)v89;
    sub_33410();
    swift_release();

    swift_bridgeObjectRelease();
    sub_6D44(v54, &qword_455C0);
    char v99 = sub_32D10() & 1;
    sub_13B10(v63, v50);
    uint64_t v56 = swift_allocObject();
    sub_13B78(v50, v56 + v71);
    id v95 = v55;
    v96 = &type metadata for CarouselViewModelSnapshot;
    unint64_t v97 = v51;
    unint64_t v98 = v52;
    swift_getOpaqueTypeConformance2();
    uint64_t v57 = v77;
    uint64_t v58 = v84;
    sub_33410();
    swift_release();
    (*(void (**)(char *, uint64_t))(v83 + 8))(v53, v58);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v79 + 32))(v85, v57, v82);
  }
  else
  {
    type metadata accessor for PosterConfigurationCarouselViewModel();
    sub_E764();
    uint64_t result = sub_32D80();
    __break(1u);
  }
  return result;
}

uint64_t sub_12F9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v8 = sub_5CC8(&qword_455E8);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a1 + *(int *)(type metadata accessor for WallpaperConfigurationsCarouselContent() + 20)))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_32A70();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v12 = v18;
    uint64_t v13 = v19;

    id v17 = v13;
    uint64_t v14 = swift_allocObject();
    *(double *)(v14 + 16) = a3;
    *(double *)(v14 + 24) = a4;
    sub_5CC8(&qword_487B8);
    sub_5CC8(&qword_45600);
    sub_E818(&qword_487C0, &qword_487B8);
    sub_14574();
    sub_15488();
    sub_33580();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a2, v11, v8);
  }
  else
  {
    type metadata accessor for PosterConfigurationCarouselViewModel();
    sub_E764();
    uint64_t result = sub_32D80();
    __break(1u);
  }
  return result;
}

double sub_131F0@<D0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t KeyPath = swift_getKeyPath();
  id v5 = v3;
  sub_335D0();
  sub_32B60();
  *(void *)a2 = v3;
  *(void *)(a2 + 8) = KeyPath;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = v7;
  *(unsigned char *)(a2 + 32) = v8;
  *(void *)(a2 + 40) = v9;
  *(unsigned char *)(a2 + 48) = v10;
  double result = *(double *)&v11;
  *(_OWORD *)(a2 + 56) = v11;
  return result;
}

uint64_t sub_132AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>)
{
  uint64_t v45 = a3;
  uint64_t v47 = a1;
  uint64_t v50 = a4;
  uint64_t v9 = sub_32D30();
  uint64_t v48 = *(void *)(v9 - 8);
  uint64_t v49 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v46 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v43 = (char *)&v40 - v12;
  uint64_t v44 = sub_32C60();
  uint64_t v13 = *(void *)(v44 - 8);
  uint64_t v14 = __chkstk_darwin(v44);
  uint64_t v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  unint64_t v18 = (char *)&v40 - v17;
  sub_14EE0((uint64_t)&v40 - v17);
  uint64_t v19 = type metadata accessor for WallpaperConfigurationsCarouselContent();
  if (*(void *)(a2 + *(int *)(v19 + 20)))
  {
    uint64_t v20 = *(void *)(a2 + *(int *)(v19 + 28));
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_32A70();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v21 = v60;
    unint64_t v51 = v61;

    type metadata accessor for PosterConfigurationCarouselViewModel();
    sub_E764();
    sub_32D70();
    swift_getKeyPath();
    sub_32D90();
    swift_release();
    swift_release();
    id v22 = v59;
    uint64_t v23 = v60;
    unint64_t v25 = v61;
    uint64_t v24 = v62;
    uint64_t v26 = v63;
    swift_getKeyPath();
    id v52 = v22;
    uint64_t v53 = v23;
    uint64_t v54 = v25;
    uint64_t v55 = v24;
    uint64_t v56 = v26;
    sub_5CC8(&qword_48798);
    sub_33550();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();

    long long v42 = v57;
    uint64_t v41 = v58;
    uint64_t v28 = v48;
    uint64_t v27 = v49;
    unint64_t v29 = *(void (**)(char *, uint64_t, uint64_t))(v48 + 16);
    unint64_t v30 = v43;
    v29(v43, v45, v49);
    uint64_t v31 = v13;
    uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    uint64_t v33 = v44;
    v32(v16, v18, v44);
    uint64_t v34 = v46;
    v29(v46, (uint64_t)v30, v27);
    uint64_t v45 = v51[2];
    (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v27);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v18, v33);
    uint64_t v35 = sub_5CC8(&qword_487A0);
    uint64_t v36 = v50;
    uint64_t v37 = v50 + *(int *)(v35 + 56);
    (*(void (**)(uint64_t, char *, uint64_t))(v31 + 32))(v37, v16, v33);
    uint64_t v38 = (int *)sub_5CC8(&qword_487A8);
    *(void *)(v37 + v38[13]) = v20;
    *(double *)(v37 + v38[14]) = a5;
    *(double *)(v37 + v38[15]) = a6;
    sub_15198(v47, v37 + v38[16], &qword_487B0);
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v28 + 32))(v37 + v38[17], v34, v27);
    *(void *)(v37 + v38[18]) = v45;
    *(void *)uint64_t v36 = v51;
    *(_OWORD *)(v36 + 8) = v42;
    *(void *)(v36 + 24) = v41;
  }
  else
  {
    type metadata accessor for PosterConfigurationCarouselViewModel();
    sub_E764();
    uint64_t result = sub_32D80();
    __break(1u);
  }
  return result;
}

uint64_t sub_13790(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = sub_32D20();
  if ((result & 1) == 0)
  {
    uint64_t v6 = type metadata accessor for WallpaperConfigurationsCarouselContent();
    uint64_t v7 = *(void *)(a4 + *(int *)(v6 + 20));
    if (v7)
    {
      if ((*(unsigned char *)(v7
                     + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_enqueueSnapshotUpdates) & 1) != 0)
        uint64_t v6 = sub_335F0();
      __chkstk_darwin(v6);
      sub_32C00();
      return swift_release();
    }
    else
    {
      type metadata accessor for PosterConfigurationCarouselViewModel();
      sub_E764();
      uint64_t result = sub_32D80();
      __break(1u);
    }
  }
  return result;
}

void sub_138B4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  sub_33620();
  sub_14E8C();
  sub_32CD0();
}

uint64_t sub_1392C(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  uint64_t result = type metadata accessor for WallpaperConfigurationsCarouselContent();
  uint64_t v6 = *(void *)(a3 + *(int *)(result + 20));
  if (v6)
  {
    if (*(unsigned char *)(v6 + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_enqueueSnapshotUpdates) == 1
      && (*a2 & 1) == 0)
    {
      *(unsigned char *)(v6 + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_enqueueSnapshotUpdates) = 0;
    }
  }
  else
  {
    type metadata accessor for PosterConfigurationCarouselViewModel();
    sub_E764();
    uint64_t result = sub_32D80();
    __break(1u);
  }
  return result;
}

uint64_t sub_139B8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  id v5 = (char *)&v13 - ((*(void *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (uint64_t *)(v2 + *(int *)(__chkstk_darwin(a1 - 8) + 40));
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  sub_13B10(v2, (uint64_t)v5);
  unint64_t v9 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v10 = swift_allocObject();
  sub_13B78((uint64_t)v5, v10 + v9);
  sub_13B10(v2, (uint64_t)v5);
  uint64_t v11 = swift_allocObject();
  uint64_t result = sub_13B78((uint64_t)v5, v11 + v9);
  *a2 = v7;
  a2[1] = v8;
  a2[2] = sub_13BDC;
  a2[3] = v10;
  a2[4] = sub_13C50;
  a2[5] = v11;
  return result;
}

uint64_t sub_13B10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WallpaperConfigurationsCarouselContent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_13B78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WallpaperConfigurationsCarouselContent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

double sub_13BDC(double a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for WallpaperConfigurationsCarouselContent() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_11B38(v4, a1);
}

double sub_13C50@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for WallpaperConfigurationsCarouselContent() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_11BE4(v4, a1);
}

double sub_13CD0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = sub_32EE0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    return *(double *)&a1;
  }
  swift_retain();
  os_log_type_t v10 = sub_33900();
  uint64_t v11 = sub_331D0();
  os_log_type_t v12 = v10;
  if (os_log_type_enabled(v11, v10))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    v16[0] = a2;
    double v17 = *(double *)&v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    v16[1] = sub_1FEFC(0x657A69534743, 0xE600000000000000, (uint64_t *)&v17);
    sub_33A30();
    _os_log_impl(&dword_0, v11, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v13, 0xCu);
    swift_arrayDestroy();
    a2 = v16[0];
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_32ED0();
  swift_getAtKeyPath();
  sub_787C(a1, a2, 0);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v17;
}

uint64_t sub_13EEC()
{
  uint64_t v1 = type metadata accessor for WallpaperConfigurationsCarouselContent();
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  sub_5CC8(&qword_486D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v3 = sub_32C60();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v0 + v2, v3);
  }
  else
  {
    swift_release();
  }
  swift_release();
  sub_787C(*(void *)(v0 + v2 + *(int *)(v1 + 24)), *(void *)(v0 + v2 + *(int *)(v1 + 24) + 8), *(unsigned char *)(v0 + v2 + *(int *)(v1 + 24) + 16));

  return swift_deallocObject();
}

uint64_t sub_14034@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for WallpaperConfigurationsCarouselContent() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  double v8 = *(double *)(v2 + 16);
  double v9 = *(double *)(v2 + v7);
  double v10 = *(double *)(v2 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8));

  return sub_11DEC(a1, v2 + v6, a2, v8, v9, v10);
}

uint64_t sub_140F0()
{
  return sub_12360(*(void *)(v0 + 24), *(void *)(v0 + 48), *(double *)(v0 + 16), *(double *)(v0 + 32), *(double *)(v0 + 40));
}

uint64_t sub_14104()
{
  uint64_t v1 = type metadata accessor for WallpaperConfigurationsCarouselContent();
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v4 = sub_32CE0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  sub_5CC8(&qword_486D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_32C60();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v0 + v2, v7);
  }
  else
  {
    swift_release();
  }
  swift_release();
  sub_787C(*(void *)(v0 + v2 + *(int *)(v1 + 24)), *(void *)(v0 + v2 + *(int *)(v1 + 24) + 8), *(unsigned char *)(v0 + v2 + *(int *)(v1 + 24) + 16));
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + ((((((v3 + v2 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + v6 + 8) & ~v6), v4);

  return swift_deallocObject();
}

uint64_t sub_142D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for WallpaperConfigurationsCarouselContent() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void *)(sub_32CE0() - 8);
  double v10 = *(double *)(v2 + 16);
  double v11 = *(double *)(v2 + v7);
  double v12 = *(double *)(v2 + v8);
  uint64_t v13 = v2 + ((v8 + *(unsigned __int8 *)(v9 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));

  return sub_12620(a1, v2 + v6, v13, a2, v10, v11, v12);
}

unint64_t sub_143DC()
{
  unint64_t result = qword_455C8;
  if (!qword_455C8)
  {
    sub_6E48(&qword_455C0);
    sub_E818(&qword_455D0, &qword_455D8);
    sub_E818(&qword_48780, &qword_48788);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_455C8);
  }
  return result;
}

unint64_t sub_144A0()
{
  unint64_t result = qword_455E0;
  if (!qword_455E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_455E0);
  }
  return result;
}

uint64_t sub_144F4@<X0>(uint64_t a1@<X8>)
{
  return sub_12F9C(*(void *)(v1 + 16), a1, *(double *)(v1 + 24), *(double *)(v1 + 32));
}

unint64_t sub_14500()
{
  unint64_t result = qword_455F0;
  if (!qword_455F0)
  {
    sub_6E48(&qword_455E8);
    sub_14574();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_455F0);
  }
  return result;
}

unint64_t sub_14574()
{
  unint64_t result = qword_455F8;
  if (!qword_455F8)
  {
    sub_6E48(&qword_45600);
    sub_145F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_455F8);
  }
  return result;
}

unint64_t sub_145F0()
{
  unint64_t result = qword_45608;
  if (!qword_45608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_45608);
  }
  return result;
}

uint64_t sub_14644()
{
  uint64_t v1 = type metadata accessor for WallpaperConfigurationsCarouselContent();
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v4 = sub_32D30();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  sub_5CC8(&qword_486D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_32C60();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v0 + v2, v7);
  }
  else
  {
    swift_release();
  }
  swift_release();
  sub_787C(*(void *)(v0 + v2 + *(int *)(v1 + 24)), *(void *)(v0 + v2 + *(int *)(v1 + 24) + 8), *(unsigned char *)(v0 + v2 + *(int *)(v1 + 24) + 16));
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + ((((((v3 + v2 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + v6 + 8) & ~v6), v4);

  return swift_deallocObject();
}

uint64_t sub_14818@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for WallpaperConfigurationsCarouselContent() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void *)(sub_32D30() - 8);
  double v10 = *(double *)(v2 + v7);
  double v11 = *(double *)(v2 + v8);
  uint64_t v12 = v2 + ((v8 + *(unsigned __int8 *)(v9 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));

  return sub_132AC(a1, v2 + v6, v12, a2, v10, v11);
}

uint64_t sub_14920()
{
  uint64_t v1 = sub_32D30();
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = type metadata accessor for WallpaperConfigurationsCarouselContent();
  uint64_t v6 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  unint64_t v7 = (v3 + v4 + v6) & ~v6;
  uint64_t v12 = *(void *)(*(void *)(v5 - 8) + 64);
  uint64_t v13 = sub_32CE0();
  uint64_t v8 = *(void *)(v13 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  sub_5CC8(&qword_486D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_32C60();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v0 + v7, v10);
  }
  else
  {
    swift_release();
  }
  swift_release();
  sub_787C(*(void *)(v0 + v7 + *(int *)(v5 + 24)), *(void *)(v0 + v7 + *(int *)(v5 + 24) + 8), *(unsigned char *)(v0 + v7 + *(int *)(v5 + 24) + 16));
  (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v0 + ((v7 + v12 + v9) & ~v9), v13);

  return swift_deallocObject();
}

uint64_t sub_14B74(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_32D30() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(type metadata accessor for WallpaperConfigurationsCarouselContent() - 8);
  unint64_t v9 = (v6 + v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  sub_32CE0();

  return sub_13790(a1, a2, v2 + v6, v2 + v9);
}

uint64_t sub_14CB8()
{
  uint64_t v1 = type metadata accessor for WallpaperConfigurationsCarouselContent();
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  sub_5CC8(&qword_486D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v3 = sub_32C60();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v0 + v2, v3);
  }
  else
  {
    swift_release();
  }
  swift_release();
  sub_787C(*(void *)(v0 + v2 + *(int *)(v1 + 24)), *(void *)(v0 + v2 + *(int *)(v1 + 24) + 8), *(unsigned char *)(v0 + v2 + *(int *)(v1 + 24) + 16));

  return swift_deallocObject();
}

uint64_t sub_14DEC(uint64_t a1, unsigned char *a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for WallpaperConfigurationsCarouselContent() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_1392C(a1, a2, v6);
}

void sub_14E6C()
{
  sub_138B4(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

unint64_t sub_14E8C()
{
  unint64_t result = qword_48790;
  if (!qword_48790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48790);
  }
  return result;
}

uint64_t sub_14EE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_32EE0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_5CC8(&qword_486D0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_151FC(v2, (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_32C60();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_33900();
    uint64_t v14 = sub_331D0();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v18[1] = a1;
      uint64_t v19 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      _OWORD v18[2] = sub_1FEFC(0x694474756F79614CLL, 0xEF6E6F6974636572, &v19);
      sub_33A30();
      _os_log_impl(&dword_0, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_32ED0();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_15198(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_5CC8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_151FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5CC8(&qword_486D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_15264(uint64_t a1, char a2)
{
  uint64_t v4 = sub_32EE0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) == 0)
  {
    swift_retain();
    os_log_type_t v8 = sub_33900();
    uint64_t v9 = sub_331D0();
    os_log_type_t v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315138;
      uint64_t v13 = sub_1FEFC(0xD000000000000016, 0x8000000000037230, &v14);
      sub_33A30();
      _os_log_impl(&dword_0, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_32ED0();
    swift_getAtKeyPath();
    sub_155AC(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v14;
  }
  return a1;
}

uint64_t sub_15470()
{
  return swift_deallocObject();
}

double sub_15480@<D0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  return sub_131F0(a1, a2);
}

unint64_t sub_15488()
{
  unint64_t result = qword_487C8[0];
  if (!qword_487C8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_487C8);
  }
  return result;
}

unint64_t sub_154E8()
{
  unint64_t result = qword_45610;
  if (!qword_45610)
  {
    sub_6E48(&qword_45618);
    sub_E818(&qword_45620, &qword_45628);
    sub_E818(&qword_45630, &qword_45638);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_45610);
  }
  return result;
}

uint64_t sub_155AC(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for SpringBoardFeatureFlags(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SpringBoardFeatureFlags(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SpringBoardFeatureFlags(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x15720);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_15748(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_15750(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SpringBoardFeatureFlags()
{
  return &type metadata for SpringBoardFeatureFlags;
}

unint64_t sub_15770()
{
  unint64_t result = qword_45640;
  if (!qword_45640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_45640);
  }
  return result;
}

BOOL sub_157C4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_157DC()
{
  Swift::UInt v1 = *v0;
  sub_33C30();
  sub_33C40(v1);
  return sub_33C50();
}

void sub_15824()
{
  sub_33C40(*v0);
}

Swift::Int sub_15850()
{
  Swift::UInt v1 = *v0;
  sub_33C30();
  sub_33C40(v1);
  return sub_33C50();
}

const char *sub_15894()
{
  return "SpringBoard";
}

const char *sub_158A8()
{
  if (*v0) {
    return "Maglev";
  }
  else {
    return "AutobahnLegacyMigration";
  }
}

uint64_t sub_158D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v45 = a1;
  uint64_t v46 = a3;
  uint64_t v40 = *(void *)(a2 - 8);
  uint64_t v5 = *(void *)(v40 + 64);
  __chkstk_darwin(a1);
  uint64_t v39 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v6[2];
  uint64_t v43 = v6[3];
  uint64_t v44 = v7;
  uint64_t v8 = v6[4];
  uint64_t v41 = v6[5];
  uint64_t v42 = v8;
  uint64_t v47 = v7;
  uint64_t v48 = v43;
  uint64_t v49 = v8;
  uint64_t v50 = v41;
  uint64_t v9 = type metadata accessor for PageIndexSelectionSyncScrollViewBoundsModifier.Payload(0, (uint64_t)&v47);
  uint64_t v35 = *(void *)(v9 - 8);
  uint64_t v10 = v35;
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v33 - v11;
  uint64_t v34 = (char *)&v33 - v11;
  swift_getWitnessTable();
  uint64_t v13 = sub_330F0();
  uint64_t v36 = v13;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v38 = WitnessTable;
  uint64_t v37 = swift_getWitnessTable();
  uint64_t v47 = v13;
  uint64_t v48 = v9;
  uint64_t v49 = WitnessTable;
  uint64_t v50 = v37;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v16 = *(void *)(OpaqueTypeMetadata2 - 8);
  uint64_t v17 = __chkstk_darwin(OpaqueTypeMetadata2);
  uint64_t v19 = (char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v33 - v20;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v3 + *(int *)(a2 + 56), v9);
  uint64_t v23 = v39;
  uint64_t v22 = v40;
  (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v39, v3, a2);
  uint64_t v24 = v22;
  unint64_t v25 = (*(unsigned __int8 *)(v22 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  uint64_t v26 = (char *)swift_allocObject();
  uint64_t v27 = v43;
  *((void *)v26 + 2) = v44;
  *((void *)v26 + 3) = v27;
  uint64_t v28 = v41;
  *((void *)v26 + 4) = v42;
  *((void *)v26 + 5) = v28;
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(&v26[v25], v23, a2);
  swift_checkMetadataState();
  unint64_t v29 = v34;
  sub_33410();
  swift_release();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v29, v9);
  unint64_t v30 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
  v30(v21, v19, OpaqueTypeMetadata2);
  uint64_t v31 = *(void (**)(char *, uint64_t))(v16 + 8);
  v31(v19, OpaqueTypeMetadata2);
  v30(v46, v21, OpaqueTypeMetadata2);
  return ((uint64_t (*)(char *, uint64_t))v31)(v21, OpaqueTypeMetadata2);
}

void sub_15CD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v36 = *(void *)(a4 - 8);
  uint64_t v37 = a3;
  uint64_t v11 = __chkstk_darwin(a1);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v11);
  uint64_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = v18;
  uint64_t v42 = v19;
  uint64_t v43 = v20;
  uint64_t v44 = v21;
  uint64_t v22 = (int *)type metadata accessor for PageIndexSelectionSyncScrollViewBoundsModifier.Payload(0, (uint64_t)&v41);
  if (sub_32D20())
  {
    sub_15F88(v22);
    if ((v24 & 1) == 0)
    {
      uint64_t v32 = v23;
      uint64_t v33 = v13;
      uint64_t v35 = *(void *)(a7 + 8);
      uint64_t v25 = *(void *)(v35 + 8);
      uint64_t v26 = v37;
      sub_33840();
      uint64_t v27 = v41;
      (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v26, a5);
      uint64_t v34 = v25;
      sub_33890();
      uint64_t v38 = v39;
      sub_33690();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, a5);
      if (v40 < v27)
      {
        __break(1u);
      }
      else
      {
        uint64_t v28 = v32;
        if (v27 > v32) {
          uint64_t v28 = v27;
        }
        uint64_t v41 = a4;
        uint64_t v42 = a5;
        if (v40 >= v28) {
          uint64_t v29 = v28;
        }
        else {
          uint64_t v29 = v40;
        }
        uint64_t v43 = a6;
        uint64_t v44 = a7;
        type metadata accessor for PageIndexSelectionSyncScrollViewBoundsModifier(0, (uint64_t)&v41);
        uint64_t v40 = v29;
        unint64_t v30 = (void (*)(uint64_t *, void))sub_338C0();
        (*(void (**)(char *))(v36 + 16))(v33);
        v30(&v41, 0);
        sub_33560();
        sub_33540();
      }
    }
  }
}

void sub_15F88(int *a1)
{
  uint64_t v3 = sub_32C60();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unsigned int v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = enum case for LayoutDirection.leftToRight(_:);
  uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  v8(v6, enum case for LayoutDirection.leftToRight(_:), v3);
  char v9 = sub_32C50();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v6, v3);
  uint64_t v11 = v1 + a1[16];
  if (v9)
  {
    if (*(unsigned char *)(v11 + 32)) {
      return;
    }
    double MinX = CGRectGetMinX(*(CGRect *)v11);
  }
  else
  {
    if (*(unsigned char *)(v11 + 32)) {
      return;
    }
    double MinX = CGRectGetMaxX(*(CGRect *)v11);
  }
  double v13 = *(double *)(v1 + a1[13]);
  double v14 = *(double *)(v1 + a1[14]) - v13;
  if (v14 < 0.0) {
    double v14 = 0.0;
  }
  double v15 = v13 + *(double *)(v1 + a1[15]);
  double v16 = round(v15 * round((MinX - v14) / v15) / v15);
  if ((~*(void *)&v16 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v16 <= -9.22337204e18)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v16 >= 9.22337204e18)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    return;
  }
  uint64_t v17 = (uint64_t)v16;
  v8(v6, v7, v3);
  char v18 = sub_32C50();
  v10(v6, v3);
  if ((v18 & 1) == 0 && __OFSUB__(*(void *)(v1 + a1[18]), v17)) {
    goto LABEL_18;
  }
}

uint64_t Comparable.clamped(to:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 - 8);
  __chkstk_darwin(a1);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_33BC0();
  sub_336B0();
  sub_33BD0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, a2);
}

uint64_t sub_162CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 64);
}

uint64_t sub_162D4()
{
  uint64_t result = sub_32C60();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_32D30();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_163B8(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_32C60();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[14];
    *(uint64_t *)((char *)a1 + a3[13]) = *(uint64_t *)((char *)a2 + a3[13]);
    *(uint64_t *)((char *)a1 + v8) = *(uint64_t *)((char *)a2 + v8);
    uint64_t v9 = a3[16];
    *(uint64_t *)((char *)a1 + a3[15]) = *(uint64_t *)((char *)a2 + a3[15]);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    long long v12 = *((_OWORD *)v11 + 1);
    *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
    *((_OWORD *)v10 + 1) = v12;
    v10[32] = v11[32];
    uint64_t v13 = a3[17];
    double v14 = (char *)a1 + v13;
    double v15 = (char *)a2 + v13;
    uint64_t v16 = sub_32D30();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    *(uint64_t *)((char *)a1 + a3[18]) = *(uint64_t *)((char *)a2 + a3[18]);
  }
  return a1;
}

uint64_t sub_1650C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_32C60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 68);
  uint64_t v6 = sub_32D30();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_165B4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_32C60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[16];
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  long long v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(unsigned char *)(v9 + 32) = *(unsigned char *)(v10 + 32);
  uint64_t v12 = a3[17];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_32D30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  return a1;
}

uint64_t sub_166B8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_32C60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  uint64_t v7 = a3[16];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  char v10 = *(unsigned char *)(v9 + 32);
  long long v11 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v11;
  *(unsigned char *)(v8 + 32) = v10;
  uint64_t v12 = a3[17];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_32D30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  return a1;
}

uint64_t sub_167C4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_32C60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[16];
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  long long v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(unsigned char *)(v9 + 32) = *(unsigned char *)(v10 + 32);
  uint64_t v12 = a3[17];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_32D30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  return a1;
}

uint64_t sub_168C8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_32C60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[16];
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  long long v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(unsigned char *)(v9 + 32) = *(unsigned char *)(v10 + 32);
  uint64_t v12 = a3[17];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_32D30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  return a1;
}

uint64_t sub_169CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_169E0);
}

uint64_t sub_169E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_32C60();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_32D30();
    long long v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 68);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_16AD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_16AEC);
}

uint64_t sub_16AEC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_32C60();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_32D30();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 68);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t type metadata accessor for PageIndexSelectionSyncScrollViewBoundsModifier.Payload(uint64_t a1, uint64_t a2)
{
  return _swift_getGenericMetadata(a1, a2, &nominal type descriptor for PageIndexSelectionSyncScrollViewBoundsModifier.Payload);
}

uint64_t sub_16C08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 48);
}

uint64_t sub_16C10(uint64_t a1)
{
  uint64_t v2 = swift_checkMetadataState();
  uint64_t v3 = v2;
  if (v4 <= 0x3F)
  {
    uint64_t v13 = *(void *)(v2 - 8) + 64;
    uint64_t v5 = *(void *)(a1 + 16);
    uint64_t v6 = sub_33560();
    if (v7 > 0x3F)
    {
      return v6;
    }
    else
    {
      uint64_t v14 = *(void *)(v6 - 8) + 64;
      v11[0] = v5;
      v11[1] = v3;
      long long v12 = *(_OWORD *)(a1 + 32);
      uint64_t v8 = type metadata accessor for PageIndexSelectionSyncScrollViewBoundsModifier.Payload(319, (uint64_t)v11);
      uint64_t v3 = v8;
      if (v9 <= 0x3F)
      {
        uint64_t v15 = *(void *)(v8 - 8) + 64;
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return v3;
}

uint64_t *sub_16D54(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v50 = *(void *)(a3 + 24);
  uint64_t v56 = *(void *)(v50 - 8);
  uint64_t v55 = *(void *)(a3 + 16);
  uint64_t v54 = *(void *)(v55 - 8);
  int v3 = *(_DWORD *)(v54 + 80);
  uint64_t v4 = v3;
  uint64_t v49 = (v3 | 7) + *(void *)(v56 + 64);
  uint64_t v5 = *(void *)(v54 + 64);
  uint64_t v6 = sub_32C60();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v52 = v7;
  uint64_t v53 = v6;
  int v8 = *(_DWORD *)(v7 + 80);
  uint64_t v9 = sub_32D30();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(_DWORD *)(v10 + 80);
  uint64_t v12 = v8 & 0xF8 | v11 | 7;
  uint64_t v13 = ((v4 + 16) & ~v4) + v5 + v12;
  uint64_t v14 = *(void *)(v7 + 64) + 7;
  uint64_t v15 = v3 | *(_DWORD *)(v56 + 80) & 0xF8 | v12;
  if (v15 != 7
    || ((v8 | *(_DWORD *)(v10 + 80) | v3 | *(_DWORD *)(v56 + 80)) & 0x100000) != 0
    || ((v13 + (v49 & ~(v3 | 7))) & ~v12)
     + ((*(void *)(*(void *)(v9 - 8) + 64)
       + 7
       + ((v11
         + 33
         + (((((((v14 & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)) & ~v11)) & 0xFFFFFFFFFFFFFFF8)
     + 8 > 0x18)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    unint64_t v30 = (uint64_t *)(v18 + ((v15 + 16) & ~v15));
    swift_retain();
  }
  else
  {
    uint64_t v19 = ~(v3 | 7);
    uint64_t v45 = ~v12;
    uint64_t v48 = ~v11;
    uint64_t v20 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v56 + 16);
    uint64_t v57 = v9;
    uint64_t v46 = v11 + 33;
    uint64_t v47 = *(void *)(v9 - 8);
    uint64_t v21 = v50;
    uint64_t v51 = *(void *)(v47 + 64) + 7;
    v20(a1, a2, v21);
    uint64_t v22 = (void *)(((unint64_t)a1 + v49) & v19);
    uint64_t v23 = (void *)(((unint64_t)a2 + v49) & v19);
    void *v22 = *v23;
    char v24 = (void *)(((unint64_t)v22 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v25 = (void *)(((unint64_t)v23 + 15) & 0xFFFFFFFFFFFFFFF8);
    void *v24 = *v25;
    uint64_t v26 = ((unint64_t)v24 + v4 + 8) & ~v4;
    uint64_t v27 = ((unint64_t)v25 + v4 + 8) & ~v4;
    uint64_t v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v54 + 16);
    swift_retain();
    swift_retain();
    v28(v26, v27, v55);
    unint64_t v29 = (unint64_t)v23 + v13;
    unint64_t v30 = a1;
    unint64_t v31 = v29 & v45;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v52 + 16))(((unint64_t)v22 + v13) & v45, v29 & v45, v53);
    uint64_t v32 = (void *)((v14 + (((unint64_t)v22 + v13) & v45)) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v33 = (void *)((v14 + v31) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v32 = *v33;
    uint64_t v34 = (void *)(((unint64_t)v32 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v35 = (void *)(((unint64_t)v33 + 15) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v34 = *v35;
    uint64_t v36 = (void *)(((unint64_t)v34 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v37 = (void *)(((unint64_t)v35 + 15) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v36 = *v37;
    unint64_t v38 = ((unint64_t)v36 + 15) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v39 = ((unint64_t)v37 + 15) & 0xFFFFFFFFFFFFFFF8;
    long long v41 = *(_OWORD *)v39;
    long long v40 = *(_OWORD *)(v39 + 16);
    *(unsigned char *)(v38 + 32) = *(unsigned char *)(v39 + 32);
    *(_OWORD *)unint64_t v38 = v41;
    *(_OWORD *)(v38 + 16) = v40;
    unint64_t v42 = (v46 + v38) & v48;
    unint64_t v43 = (v46 + v39) & v48;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v47 + 16))(v42, v43, v57);
    *(void *)((v51 + v42) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v51 + v43) & 0xFFFFFFFFFFFFFFF8);
  }
  return v30;
}

uint64_t sub_17140(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)(a2 + 24) - 8) + 8;
  (*(void (**)(void))v4)();
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v4 + 56);
  uint64_t v7 = *(void *)(v5 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v6 + a1 + (v8 | 7)) & ~(v8 | 7);
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v7 + 8))((v8 + ((v9 + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v8, v5);
  uint64_t v10 = *(void *)(v7 + 64);
  uint64_t v11 = sub_32C60();
  uint64_t v12 = *(void *)(v11 - 8);
  int v13 = *(_DWORD *)(v12 + 80) & 0xF8;
  uint64_t v14 = sub_32D30();
  uint64_t v20 = *(void *)(v14 - 8);
  uint64_t v15 = *(unsigned __int8 *)(v20 + 80);
  unint64_t v16 = (v9 + ((v8 + 16) & ~v8) + v10 + (v13 | v15 | 7)) & ~(unint64_t)(v13 | v15 | 7);
  (*(void (**)(unint64_t, uint64_t))(v12 + 8))(v16, v11);
  unint64_t v17 = (v15
       + ((((((((*(void *)(v12 + 64) + v16 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
         + 15) & 0xFFFFFFFFFFFFFFF8)
       + 33) & ~v15;
  uint64_t v18 = *(uint64_t (**)(unint64_t, uint64_t))(v20 + 8);

  return v18(v17, v14);
}

uint64_t sub_17340(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  uint64_t v10 = v8 + 16;
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = (v11 | 7) + *(void *)(v5 + 48);
  int v13 = (void *)((v12 + a1) & ~(v11 | 7));
  uint64_t v14 = (void *)((v12 + a2) & ~(v11 | 7));
  *int v13 = *v14;
  uint64_t v15 = (void *)(((unint64_t)v13 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v16 = (void *)(((unint64_t)v14 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v15 = *v16;
  uint64_t v17 = ((unint64_t)v15 + v11 + 8) & ~v11;
  uint64_t v18 = ((unint64_t)v16 + v11 + 8) & ~v11;
  swift_retain();
  swift_retain();
  v9(v17, v18, v7);
  uint64_t v19 = (v11 + 16) & ~v11;
  uint64_t v20 = *(void *)(v10 + 48);
  uint64_t v21 = sub_32C60();
  uint64_t v22 = *(void *)(v21 - 8);
  LODWORD(v11) = *(_DWORD *)(v22 + 80) & 0xF8;
  uint64_t v23 = sub_32D30();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(unsigned __int8 *)(v24 + 80);
  uint64_t v26 = v11 | v25 | 7;
  uint64_t v27 = v20 + v26 + v19;
  unint64_t v28 = ((unint64_t)v13 + v27) & ~v26;
  unint64_t v29 = ((unint64_t)v14 + v27) & ~v26;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v22 + 16))(v28, v29, v21);
  uint64_t v30 = *(void *)(v22 + 64) + 7;
  unint64_t v31 = v30 + v28;
  uint64_t v32 = (void *)((v30 + v29) & 0xFFFFFFFFFFFFFFF8);
  v31 &= 0xFFFFFFFFFFFFFFF8;
  *(void *)unint64_t v31 = *v32;
  uint64_t v33 = (void *)(((unint64_t)v32 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v34 = (void *)((v31 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v34 = *v33;
  uint64_t v35 = (void *)(((unint64_t)v33 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v36 = (void *)(((unint64_t)v34 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v36 = *v35;
  unint64_t v37 = ((unint64_t)v36 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v38 = ((unint64_t)v35 + 15) & 0xFFFFFFFFFFFFFFF8;
  long long v40 = *(_OWORD *)v38;
  long long v39 = *(_OWORD *)(v38 + 16);
  *(unsigned char *)(v37 + 32) = *(unsigned char *)(v38 + 32);
  *(_OWORD *)unint64_t v37 = v40;
  *(_OWORD *)(v37 + 16) = v39;
  uint64_t v41 = (v25 + 33 + v37) & ~v25;
  uint64_t v42 = (v25 + 33 + v38) & ~v25;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v41, v42, v23);
  *(void *)((*(void *)(v24 + 64) + 7 + v41) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v24 + 64)
                                                                                       + 7
                                                                                       + v42) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_175C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 24) - 8) + 24;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = (v9 | 7) + *(void *)(v6 + 40);
  uint64_t v11 = (void *)((v10 + a1) & ~(v9 | 7));
  uint64_t v12 = (void *)((v10 + a2) & ~(v9 | 7));
  *uint64_t v11 = *v12;
  swift_retain();
  swift_release();
  int v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = (void *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *int v13 = *v14;
  swift_retain();
  swift_release();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 24))(((unint64_t)v13 + v9 + 8) & ~v9, ((unint64_t)v14 + v9 + 8) & ~v9, v7);
  uint64_t v15 = *(void *)(v8 + 64) + ((v9 + 16) & ~v9);
  uint64_t v16 = sub_32C60();
  uint64_t v17 = *(void *)(v16 - 8);
  LODWORD(v13) = *(_DWORD *)(v17 + 80) & 0xF8;
  uint64_t v18 = sub_32D30();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = v13 | v20 | 7;
  unint64_t v22 = ((unint64_t)v11 + v15 + v21) & ~v21;
  unint64_t v23 = ((unint64_t)v12 + v15 + v21) & ~v21;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v17 + 24))(v22, v23, v16);
  uint64_t v24 = *(void *)(v17 + 64) + 7;
  unint64_t v25 = v24 + v22;
  uint64_t v26 = (void *)((v24 + v23) & 0xFFFFFFFFFFFFFFF8);
  v25 &= 0xFFFFFFFFFFFFFFF8;
  *(void *)unint64_t v25 = *v26;
  uint64_t v27 = (void *)(((unint64_t)v26 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v28 = (void *)((v25 + 15) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v28 = *v27;
  unint64_t v29 = (void *)(((unint64_t)v27 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v30 = (void *)(((unint64_t)v28 + 15) & 0xFFFFFFFFFFFFFFF8);
  void *v30 = *v29;
  unint64_t v31 = ((unint64_t)v30 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v32 = ((unint64_t)v29 + 15) & 0xFFFFFFFFFFFFFFF8;
  long long v34 = *(_OWORD *)v32;
  long long v33 = *(_OWORD *)(v32 + 16);
  *(unsigned char *)(v31 + 32) = *(unsigned char *)(v32 + 32);
  *(_OWORD *)unint64_t v31 = v34;
  *(_OWORD *)(v31 + 16) = v33;
  uint64_t v35 = (v20 + 33 + v31) & ~v20;
  uint64_t v36 = (v20 + 33 + v32) & ~v20;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 24))(v35, v36, v18);
  *(void *)((*(void *)(v19 + 64) + 7 + v35) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v19 + 64)
                                                                                       + 7
                                                                                       + v36) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_17864(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v7 = *(void *)(v5 + 32);
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v9 = *(void (**)(unint64_t, unint64_t))(v8 + 32);
  uint64_t v10 = v8 + 32;
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = (v11 | 7) + v7;
  int v13 = (void *)((v12 + a1) & ~(v11 | 7));
  uint64_t v14 = (void *)((v12 + a2) & ~(v11 | 7));
  *int v13 = *v14;
  uint64_t v15 = (void *)(((unint64_t)v13 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = (void *)(((unint64_t)v14 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v15 = *v16;
  v9(((unint64_t)v15 + v11 + 8) & ~v11, ((unint64_t)v16 + v11 + 8) & ~v11);
  uint64_t v17 = *(void *)(v10 + 32);
  uint64_t v18 = sub_32C60();
  uint64_t v19 = *(void *)(v18 - 8);
  int v20 = *(_DWORD *)(v19 + 80) & 0xF8;
  uint64_t v21 = sub_32D30();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(unsigned __int8 *)(v22 + 80);
  uint64_t v24 = v20 | v23 | 7;
  uint64_t v25 = v17 + v24 + ((v11 + 16) & ~v11);
  unint64_t v26 = ((unint64_t)v13 + v25) & ~v24;
  unint64_t v27 = ((unint64_t)v14 + v25) & ~v24;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v19 + 32))(v26, v27, v18);
  uint64_t v28 = *(void *)(v19 + 64) + 7;
  unint64_t v29 = v28 + v26;
  uint64_t v30 = (void *)((v28 + v27) & 0xFFFFFFFFFFFFFFF8);
  v29 &= 0xFFFFFFFFFFFFFFF8;
  *(void *)unint64_t v29 = *v30;
  unint64_t v31 = (void *)(((unint64_t)v30 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v32 = (void *)((v29 + 15) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v32 = *v31;
  long long v33 = (void *)(((unint64_t)v31 + 15) & 0xFFFFFFFFFFFFFFF8);
  long long v34 = (void *)(((unint64_t)v32 + 15) & 0xFFFFFFFFFFFFFFF8);
  *long long v34 = *v33;
  unint64_t v35 = ((unint64_t)v34 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v36 = ((unint64_t)v33 + 15) & 0xFFFFFFFFFFFFFFF8;
  long long v38 = *(_OWORD *)v36;
  long long v37 = *(_OWORD *)(v36 + 16);
  *(unsigned char *)(v35 + 32) = *(unsigned char *)(v36 + 32);
  *(_OWORD *)unint64_t v35 = v38;
  *(_OWORD *)(v35 + 16) = v37;
  uint64_t v39 = (v23 + 33 + v35) & ~v23;
  uint64_t v40 = (v23 + 33 + v36) & ~v23;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(v39, v40, v21);
  *(void *)((*(void *)(v22 + 64) + 7 + v39) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v22 + 64)
                                                                                       + 7
                                                                                       + v40) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_17AD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 24) - 8) + 40;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = (v9 | 7) + *(void *)(v6 + 24);
  uint64_t v11 = (void *)((v10 + a1) & ~(v9 | 7));
  uint64_t v12 = (void *)((v10 + a2) & ~(v9 | 7));
  *uint64_t v11 = *v12;
  swift_release();
  int v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = (void *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *int v13 = *v14;
  swift_release();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 40))(((unint64_t)v13 + v9 + 8) & ~v9, ((unint64_t)v14 + v9 + 8) & ~v9, v7);
  uint64_t v15 = *(void *)(v8 + 64) + ((v9 + 16) & ~v9);
  uint64_t v16 = sub_32C60();
  uint64_t v17 = *(void *)(v16 - 8);
  int v18 = *(_DWORD *)(v17 + 80) & 0xF8;
  uint64_t v19 = sub_32D30();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(unsigned __int8 *)(v20 + 80);
  uint64_t v22 = v18 | v21 | 7;
  unint64_t v23 = ((unint64_t)v11 + v15 + v22) & ~v22;
  unint64_t v24 = ((unint64_t)v12 + v15 + v22) & ~v22;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v17 + 40))(v23, v24, v16);
  uint64_t v25 = *(void *)(v17 + 64) + 7;
  unint64_t v26 = v25 + v23;
  unint64_t v27 = (void *)((v25 + v24) & 0xFFFFFFFFFFFFFFF8);
  v26 &= 0xFFFFFFFFFFFFFFF8;
  *(void *)unint64_t v26 = *v27;
  uint64_t v28 = (void *)(((unint64_t)v27 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v29 = (void *)((v26 + 15) & 0xFFFFFFFFFFFFFFF8);
  void *v29 = *v28;
  uint64_t v30 = (void *)(((unint64_t)v28 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v31 = (void *)(((unint64_t)v29 + 15) & 0xFFFFFFFFFFFFFFF8);
  void *v31 = *v30;
  unint64_t v32 = ((unint64_t)v31 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v33 = ((unint64_t)v30 + 15) & 0xFFFFFFFFFFFFFFF8;
  long long v35 = *(_OWORD *)v33;
  long long v34 = *(_OWORD *)(v33 + 16);
  *(unsigned char *)(v32 + 32) = *(unsigned char *)(v33 + 32);
  *(_OWORD *)unint64_t v32 = v35;
  *(_OWORD *)(v32 + 16) = v34;
  uint64_t v36 = (v21 + 33 + v32) & ~v21;
  uint64_t v37 = (v21 + 33 + v33) & ~v21;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 40))(v36, v37, v19);
  *(void *)((*(void *)(v20 + 64) + 7 + v36) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v20 + 64)
                                                                                       + 7
                                                                                       + v37) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_17D60(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v45 = *(void *)(a3 + 24);
  uint64_t v4 = *(void *)(v45 - 8);
  uint64_t v5 = *(unsigned int *)(v4 + 84);
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(_DWORD *)(v6 + 84) <= 0x7FFFFFFFu) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v6 + 84);
  }
  int v43 = *(_DWORD *)(v6 + 84);
  unsigned int v44 = v7;
  if (v7 <= v5) {
    unsigned int v8 = *(_DWORD *)(v4 + 84);
  }
  else {
    unsigned int v8 = v7;
  }
  uint64_t v42 = sub_32C60();
  uint64_t v9 = *(void *)(v42 - 8);
  uint64_t v10 = *(unsigned int *)(v9 + 84);
  uint64_t v11 = *(void *)(sub_32D30() - 8);
  uint64_t v12 = v11;
  unsigned int v13 = *(_DWORD *)(v11 + 84);
  if (v13 <= v10) {
    unsigned int v14 = v10;
  }
  else {
    unsigned int v14 = *(_DWORD *)(v11 + 84);
  }
  uint64_t v15 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v16 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v17 = *(void *)(v11 + 64);
  if (v14 <= v8) {
    unsigned int v18 = v8;
  }
  else {
    unsigned int v18 = v14;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v19 = v15 | 7;
  uint64_t v20 = (v15 | 7) + *(void *)(v4 + 64);
  uint64_t v21 = *(_DWORD *)(v9 + 80) & 0xF8 | v16 | 7;
  uint64_t v22 = ((v15 + 16) & ~v15) + *(void *)(v6 + 64) + v21;
  uint64_t v23 = *(void *)(v9 + 64) + 7;
  uint64_t v24 = v16 + 33;
  uint64_t v25 = a1;
  if (a2 <= v18) {
    goto LABEL_31;
  }
  unint64_t v26 = ((v22 + (v20 & ~v19)) & ~v21)
      + ((v17
        + ((v24
          + (((((((v23 & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)) & ~v16)
        + 7) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  char v27 = 8 * v26;
  if (v26 > 3) {
    goto LABEL_16;
  }
  unsigned int v30 = ((a2 - v18 + ~(-1 << v27)) >> v27) + 1;
  if (HIWORD(v30))
  {
    int v28 = *(_DWORD *)((char *)a1 + v26);
    if (v28) {
      goto LABEL_24;
    }
  }
  else
  {
    if (v30 <= 0xFF)
    {
      if (v30 < 2) {
        goto LABEL_31;
      }
LABEL_16:
      int v28 = *((unsigned __int8 *)a1 + v26);
      if (!*((unsigned char *)a1 + v26)) {
        goto LABEL_31;
      }
LABEL_24:
      int v31 = (v28 - 1) << v27;
      if (v26 > 3) {
        int v31 = 0;
      }
      if (v26) {
        int v32 = *a1;
      }
      else {
        int v32 = 0;
      }
      return v18 + (v32 | v31) + 1;
    }
    int v28 = *(unsigned __int16 *)((char *)a1 + v26);
    if (*(_WORD *)((char *)a1 + v26)) {
      goto LABEL_24;
    }
  }
LABEL_31:
  if (v5 == v18)
  {
    uint64_t v33 = v45;
    long long v34 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(v4 + 48);
    uint64_t v35 = v5;
LABEL_33:
    return v34(v25, v35, v33);
  }
  unint64_t v36 = ((unint64_t)a1 + v20) & ~v19;
  if (v44 == v18)
  {
    uint64_t v37 = (unint64_t *)((v36 + 15) & 0xFFFFFFFFFFFFFFF8);
    if (v43 < 0)
    {
      uint64_t v41 = *(uint64_t (**)(unint64_t))(v6 + 48);
      return v41(((unint64_t)v37 + v15 + 8) & ~v15);
    }
    else
    {
      unint64_t v38 = *v37;
      if (v38 >= 0xFFFFFFFF) {
        LODWORD(v38) = -1;
      }
      return (v38 + 1);
    }
  }
  else
  {
    uint64_t v25 = (_DWORD *)((v22 + v36) & ~v21);
    if (v10 >= v13)
    {
      long long v34 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(v9 + 48);
      uint64_t v35 = v10;
      uint64_t v33 = v42;
      goto LABEL_33;
    }
    unint64_t v39 = (v24
         + (((((((((unint64_t)v25 + v23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
           + 15) & 0xFFFFFFFFFFFFFFF8)) & ~v16;
    uint64_t v40 = *(uint64_t (**)(unint64_t))(v12 + 48);
    return v40(v39);
  }
}

void sub_1819C(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v47 = *(void *)(a4 + 24);
  uint64_t v4 = *(void *)(v47 - 8);
  uint64_t v46 = v4;
  uint64_t v5 = *(unsigned int *)(v4 + 84);
  uint64_t v44 = *(void *)(a4 + 16);
  uint64_t v6 = *(void *)(v44 - 8);
  uint64_t v51 = v6;
  unsigned int v45 = *(_DWORD *)(v6 + 84);
  if (v45 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v6 + 84);
  }
  if (v7 <= v5) {
    unsigned int v8 = *(_DWORD *)(v4 + 84);
  }
  else {
    unsigned int v8 = v7;
  }
  uint64_t v43 = sub_32C60();
  uint64_t v9 = *(void *)(v43 - 8);
  uint64_t v10 = *(unsigned int *)(v9 + 84);
  uint64_t v11 = *(void *)(sub_32D30() - 8);
  uint64_t v12 = v11;
  unsigned int v13 = *(_DWORD *)(v11 + 84);
  if (v13 <= v10) {
    unsigned int v14 = v10;
  }
  else {
    unsigned int v14 = *(_DWORD *)(v11 + 84);
  }
  if (v14 <= v8) {
    unsigned int v15 = v8;
  }
  else {
    unsigned int v15 = v14;
  }
  uint64_t v16 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v17 = (v16 | 7) + *(void *)(v4 + 64);
  uint64_t v18 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v19 = *(_DWORD *)(v9 + 80) & 0xF8 | v18 | 7;
  uint64_t v20 = ((v16 + 16) & ~v16) + *(void *)(v6 + 64) + v19;
  uint64_t v21 = *(void *)(v9 + 64) + 7;
  size_t v22 = ((*(void *)(v11 + 64)
        + ((v18
          + 33
          + (((((((v21 & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)) & ~v18)
        + 7) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  size_t v23 = v22 + ((v20 + (v17 & ~(v16 | 7))) & ~v19);
  if (a3 <= v15)
  {
    int v27 = 0;
  }
  else
  {
    unsigned int v24 = a3 - v15 + 1;
    unsigned int v25 = HIWORD(v24);
    if (v24 >= 0x100) {
      int v26 = 2;
    }
    else {
      int v26 = v24 > 1;
    }
    if (v25) {
      int v26 = 4;
    }
    if (v23) {
      int v27 = 1;
    }
    else {
      int v27 = v26;
    }
  }
  int v28 = a2 - v15;
  if (a2 > v15)
  {
    if (v23)
    {
      unsigned int v29 = ~v15 + a2;
      bzero(a1, v23);
      *a1 = v29;
      int v28 = 1;
    }
    switch(v27)
    {
      case 1:
        *((unsigned char *)a1 + v23) = v28;
        return;
      case 2:
        *(_WORD *)((char *)a1 + v23) = v28;
        return;
      case 3:
        goto LABEL_58;
      case 4:
        *(unsigned int *)((char *)a1 + v23) = v28;
        return;
      default:
        return;
    }
  }
  uint64_t v30 = ~v19;
  switch(v27)
  {
    case 1:
      *((unsigned char *)a1 + v23) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 2:
      *(_WORD *)((char *)a1 + v23) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 3:
LABEL_58:
      __break(1u);
      JUMPOUT(0x1863CLL);
    case 4:
      *(unsigned int *)((char *)a1 + v23) = 0;
      goto LABEL_34;
    default:
LABEL_34:
      if (!a2) {
        return;
      }
LABEL_35:
      if (v5 == v15)
      {
        uint64_t v31 = v47;
        int v32 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v46 + 56);
        uint64_t v33 = (uint64_t)a1;
        uint64_t v34 = a2;
        uint64_t v35 = v5;
LABEL_37:
        v32(v33, v34, v35, v31);
        return;
      }
      uint64_t v36 = ((unint64_t)a1 + v17) & ~(v16 | 7);
      if (v7 == v15)
      {
        uint64_t v37 = (void *)((v36 + 15) & 0xFFFFFFFFFFFFFFF8);
        uint64_t v35 = v45;
        if ((v45 & 0x80000000) == 0)
        {
          if ((a2 & 0x80000000) != 0) {
            uint64_t v38 = a2 ^ 0x80000000;
          }
          else {
            uint64_t v38 = a2 - 1;
          }
          void *v37 = v38;
          return;
        }
        uint64_t v33 = ((unint64_t)v37 + v16 + 8) & ~v16;
        int v32 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v51 + 56);
        uint64_t v34 = a2;
        uint64_t v31 = v44;
        goto LABEL_37;
      }
      unint64_t v39 = (_DWORD *)((v20 + v36) & v30);
      if (v14 >= a2)
      {
        if (v10 >= v13)
        {
          int v32 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
          uint64_t v33 = (v20 + v36) & v30;
          uint64_t v34 = a2;
          uint64_t v35 = v10;
          uint64_t v31 = v43;
          goto LABEL_37;
        }
        unint64_t v41 = (v18
             + 33
             + (((((((((unint64_t)v39 + v21) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
               + 15) & 0xFFFFFFFFFFFFFFF8)) & ~v18;
        uint64_t v42 = *(void (**)(unint64_t, void))(v12 + 56);
        v42(v41, a2);
      }
      else if (v22)
      {
        unsigned int v40 = ~v14 + a2;
        bzero((void *)((v20 + v36) & v30), v22);
        *unint64_t v39 = v40;
      }
      return;
  }
}

uint64_t type metadata accessor for PageIndexSelectionSyncScrollViewBoundsModifier(uint64_t a1, uint64_t a2)
{
  return _swift_getGenericMetadata(a1, a2, &nominal type descriptor for PageIndexSelectionSyncScrollViewBoundsModifier);
}

uint64_t sub_1867C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_186C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v76[0] = a3;
  v76[1] = a4;
  v76[2] = a5;
  v76[3] = a6;
  unsigned int v8 = (int *)type metadata accessor for PageIndexSelectionSyncScrollViewBoundsModifier.Payload(0, (uint64_t)v76);
  uint64_t v9 = *((void *)v8 - 1);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v68 = (char *)&v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  unsigned int v14 = (char *)&v68 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v73 = (char *)&v68 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v74 = (char *)&v68 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v72 = (char *)&v68 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v75 = (char *)&v68 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  unsigned int v25 = (char *)&v68 - v24;
  uint64_t v26 = __chkstk_darwin(v23);
  int v28 = (char *)&v68 - v27;
  uint64_t v29 = *(int *)(v26 + 52);
  double v30 = *(double *)(a1 + v29);
  double v31 = *(double *)(a2 + v29);
  uint64_t v70 = v9;
  int v32 = *(void (**)(char *, uint64_t, int *))(v9 + 16);
  v32((char *)&v68 - v27, a1, v8);
  uint64_t v33 = a2;
  v32(v25, a2, v8);
  uint64_t v69 = v14;
  uint64_t v71 = a2;
  if (v30 != v31)
  {
    uint64_t v35 = *(void (**)(void))(v9 + 8);
    uint64_t v60 = a1;
    uint64_t v37 = v33;
    ((void (*)(char *, int *))v35)(v25, v8);
    ((void (*)(char *, int *))v35)(v28, v8);
    uint64_t v40 = v60;
    v32(v75, v60, v8);
    unint64_t v39 = v72;
    v32(v72, v33, v8);
    goto LABEL_8;
  }
  double v34 = *(double *)&v28[v8[14]];
  uint64_t v35 = *(void (**)(void))(v9 + 8);
  uint64_t v36 = a1;
  uint64_t v37 = a2;
  ((void (*)(char *, int *))v35)(v28, v8);
  double v38 = *(double *)&v25[v8[14]];
  ((void (*)(char *, int *))v35)(v25, v8);
  v32(v75, v36, v8);
  unint64_t v39 = v72;
  v32(v72, a2, v8);
  uint64_t v40 = v36;
  if (v34 != v38)
  {
LABEL_8:
    id v59 = v68;
    uint64_t v61 = v37;
    ((void (*)(char *, int *))v35)(v39, v8);
    ((void (*)(char *, int *))v35)(v75, v8);
    uint64_t v43 = v74;
    v32(v74, v40, v8);
    uint64_t v45 = v40;
    uint64_t v44 = v73;
    v32(v73, v61, v8);
LABEL_10:
    ((void (*)(char *, int *))v35)(v44, v8);
    ((void (*)(char *, int *))v35)(v43, v8);
    uint64_t v58 = v69;
LABEL_11:
    v32(v58, v45, v8);
    v32(v59, v71, v8);
    goto LABEL_12;
  }
  double v41 = *(double *)&v75[v8[15]];
  v35();
  double v42 = *(double *)&v39[v8[15]];
  ((void (*)(char *, int *))v35)(v39, v8);
  uint64_t v43 = v74;
  v32(v74, v36, v8);
  uint64_t v44 = v73;
  v32(v73, a2, v8);
  uint64_t v45 = v36;
  if (v41 != v42)
  {
    id v59 = v68;
    goto LABEL_10;
  }
  uint64_t v46 = v8[16];
  double v47 = *(double *)&v43[v46];
  double v48 = *(double *)&v43[v46 + 8];
  double v49 = *(double *)&v43[v46 + 16];
  double v50 = *(double *)&v43[v46 + 24];
  char v51 = v43[v46 + 32];
  uint64_t v52 = &v44[v46];
  double v53 = *(double *)v52;
  double v54 = *((double *)v52 + 1);
  double v55 = *((double *)v52 + 2);
  double v56 = *((double *)v52 + 3);
  char v57 = v52[32];
  LOBYTE(v76[0]) = v57;
  if (v51)
  {
    ((void (*)(char *, int *, double, double, double, double, double, double, double, double))v35)(v44, v8, v47, v48, v49, v50, v53, v54, v55, v56);
    ((void (*)(char *, int *))v35)(v43, v8);
    if (v76[0])
    {
      uint64_t v58 = v69;
      v32(v69, v36, v8);
      id v59 = v68;
      v32(v68, v71, v8);
LABEL_18:
      char v67 = sub_32D20();
      char v62 = v67 ^ sub_32D20() ^ 1;
      goto LABEL_13;
    }
    goto LABEL_16;
  }
  if (v57)
  {
    ((void (*)(char *, int *, double, double, double, double, double, double, double, double))v35)(v44, v8, v47, v48, v49, v50, v53, v54, v55, v56);
    ((void (*)(char *, int *))v35)(v43, v8);
LABEL_16:
    uint64_t v58 = v69;
    id v59 = v68;
    goto LABEL_11;
  }
  BOOL v64 = CGRectEqualToRect(*(CGRect *)&v47, *(CGRect *)&v53);
  uint64_t v65 = v44;
  BOOL v66 = v64;
  ((void (*)(char *, int *))v35)(v65, v8);
  ((void (*)(char *, int *))v35)(v43, v8);
  uint64_t v58 = v69;
  v32(v69, v36, v8);
  id v59 = v68;
  v32(v68, v71, v8);
  if (v66) {
    goto LABEL_18;
  }
LABEL_12:
  char v62 = 0;
LABEL_13:
  ((void (*)(char *, int *))v35)(v59, v8);
  ((void (*)(char *, int *))v35)(v58, v8);
  return v62 & 1;
}

uint64_t sub_18CC0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_186C0(a1, a2, a3[2], a3[3], a3[4], a3[5]);
}

uint64_t sub_18CD0()
{
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v14 = v0[2];
  uint64_t v1 = v14;
  uint64_t v15 = v2;
  uint64_t v16 = v3;
  uint64_t v17 = v4;
  uint64_t v5 = (int *)(type metadata accessor for PageIndexSelectionSyncScrollViewBoundsModifier(0, (uint64_t)&v14) - 8);
  uint64_t v6 = (char *)v0
     + ((*(unsigned __int8 *)(*(void *)v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v5 + 80));
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v6, v2);
  unsigned int v7 = &v6[v5[15]];
  swift_release();
  swift_release();
  uint64_t v8 = sub_33560();
  (*(void (**)(char *, uint64_t))(*(void *)(v1 - 8) + 8))(&v7[*(int *)(v8 + 32)], v1);
  uint64_t v9 = &v6[v5[16]];
  uint64_t v10 = sub_32C60();
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v14 = v1;
  uint64_t v15 = v2;
  uint64_t v16 = v3;
  uint64_t v17 = v4;
  uint64_t v11 = &v9[*(int *)(type metadata accessor for PageIndexSelectionSyncScrollViewBoundsModifier.Payload(0, (uint64_t)&v14)+ 68)];
  uint64_t v12 = sub_32D30();
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  return swift_deallocObject();
}

void sub_18EB8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[3];
  uint64_t v7 = v2[4];
  uint64_t v8 = v2[5];
  v11[0] = v2[2];
  uint64_t v5 = v11[0];
  v11[1] = v6;
  void v11[2] = v7;
  v11[3] = v8;
  uint64_t v9 = *(void *)(type metadata accessor for PageIndexSelectionSyncScrollViewBoundsModifier(0, (uint64_t)v11) - 8);
  uint64_t v10 = (uint64_t)v2 + ((*(unsigned __int8 *)(v9 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));

  sub_15CD4(a1, a2, v10, v5, v6, v7, v8);
}

uint64_t sub_18F74(uint64_t *a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v10 = *a1;
  uint64_t v1 = v10;
  uint64_t v11 = v2;
  uint64_t v12 = v3;
  uint64_t v13 = v4;
  type metadata accessor for PageIndexSelectionSyncScrollViewBoundsModifier(255, (uint64_t)&v10);
  swift_getWitnessTable();
  uint64_t v5 = sub_330F0();
  uint64_t v10 = v1;
  uint64_t v11 = v2;
  uint64_t v12 = v3;
  uint64_t v13 = v4;
  uint64_t v6 = type metadata accessor for PageIndexSelectionSyncScrollViewBoundsModifier.Payload(255, (uint64_t)&v10);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v8 = swift_getWitnessTable();
  uint64_t v10 = v5;
  uint64_t v11 = v6;
  uint64_t v12 = WitnessTable;
  uint64_t v13 = v8;
  return swift_getOpaqueTypeConformance2();
}

void *initializeBufferWithCopyOfBuffer for PosterGestureTutorialAnimationView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for PosterGestureTutorialAnimationView()
{
  return swift_release();
}

void *assignWithCopy for PosterGestureTutorialAnimationView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for PosterGestureTutorialAnimationView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PosterGestureTutorialAnimationView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PosterGestureTutorialAnimationView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PosterGestureTutorialAnimationView()
{
  return &type metadata for PosterGestureTutorialAnimationView;
}

void sub_191B8(unsigned char *a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_32A70();
  swift_release();
  swift_release();
  swift_release();
  if (v7)
  {
    a1[OBJC_IVAR____TtC17WallpaperSettings41PosterGestureTutorialAnimationPackageView_animating] = 0;
    id v2 = [a1 layer];
    [v2 convertTime:0 fromLayer:CACurrentMediaTime()];
    double v4 = v3;

    id v5 = [a1 layer];
    [v5 setSpeed:0.0];

    id v6 = [a1 layer];
    [v6 setTimeOffset:v4];
  }
  else
  {
    sub_2F500();
  }
}

id sub_192F4()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for PosterGestureTutorialAnimationPackageView());

  return objc_msgSend(v0, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
}

void sub_1933C(unsigned char *a1)
{
}

uint64_t sub_19348(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_19498();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_193AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_19498();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_19410()
{
}

unint64_t sub_1943C()
{
  unint64_t result = qword_488D0;
  if (!qword_488D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_488D0);
  }
  return result;
}

unint64_t sub_19498()
{
  unint64_t result = qword_488D8;
  if (!qword_488D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_488D8);
  }
  return result;
}

double sub_194F0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_32A70();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_19564()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_32A70();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_195D8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_32A70();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1964C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17WallpaperSettings26WallpaperAutobahnViewModel__screenSize;
  uint64_t v2 = sub_5CC8(&qword_457C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC17WallpaperSettings26WallpaperAutobahnViewModel__interfaceOrientation;
  uint64_t v4 = sub_5CC8(&qword_457C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC17WallpaperSettings26WallpaperAutobahnViewModel__isOccluded;
  uint64_t v6 = sub_5CC8(&qword_488E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v8 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v7, v8);
}

uint64_t sub_19780()
{
  return type metadata accessor for WallpaperAutobahnViewModel();
}

uint64_t type metadata accessor for WallpaperAutobahnViewModel()
{
  uint64_t result = qword_45688;
  if (!qword_45688) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_197D4()
{
  sub_19910(319, &qword_45698, type metadata accessor for CGSize);
  if (v0 <= 0x3F)
  {
    sub_19910(319, (unint64_t *)&unk_456A0, type metadata accessor for BSInterfaceOrientation);
    if (v1 <= 0x3F)
    {
      sub_19964();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_19910(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_32A90();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_19964()
{
  if (!qword_488E0)
  {
    unint64_t v0 = sub_32A90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_488E0);
    }
  }
}

void *sub_199BC()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_199C8()
{
  uint64_t v17 = sub_5CC8(&qword_488E8);
  uint64_t v1 = *(void *)(v17 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_5CC8(&qword_457C8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_5CC8(&qword_457C0);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v0 + OBJC_IVAR____TtC17WallpaperSettings26WallpaperAutobahnViewModel__screenSize;
  long long v18 = xmmword_357A0;
  type metadata accessor for CGSize(0);
  sub_32A60();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v12, v11, v8);
  uint64_t v13 = v0 + OBJC_IVAR____TtC17WallpaperSettings26WallpaperAutobahnViewModel__interfaceOrientation;
  *(void *)&long long v18 = 1;
  type metadata accessor for BSInterfaceOrientation(0);
  sub_32A60();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v13, v7, v4);
  uint64_t v14 = v0 + OBJC_IVAR____TtC17WallpaperSettings26WallpaperAutobahnViewModel__isOccluded;
  LOBYTE(v18) = 0;
  sub_32A60();
  (*(void (**)(uint64_t, char *, uint64_t))(v1 + 32))(v14, v3, v17);
  return v0;
}

uint64_t sub_19C58@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for WallpaperAutobahnViewModel();
  uint64_t result = sub_32A50();
  *a1 = result;
  return result;
}

uint64_t sub_19C98@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_32A70();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_19D1C()
{
  return sub_32A80();
}

NSString sub_19DA4()
{
  NSString result = sub_336D0();
  qword_4A3E0 = (uint64_t)result;
  return result;
}

void *initializeBufferWithCopyOfBuffer for WSSnapshotUpdateUserInfoKey(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for WSSnapshotUpdateUserInfoKey()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for WSSnapshotUpdateUserInfoKey(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for WSSnapshotUpdateUserInfoKey(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for WSSnapshotUpdateUserInfoKey()
{
  return &type metadata for WSSnapshotUpdateUserInfoKey;
}

unint64_t sub_19E9C@<X0>(uint64_t *a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t result = sub_1A06C(*a1, a1[1]);
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_19ECC@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

Swift::Int sub_19ED8()
{
  return sub_33C50();
}

uint64_t sub_19F34()
{
  swift_bridgeObjectRetain();
  sub_33700();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_19F8C()
{
  return sub_33C50();
}

uint64_t sub_19FE4(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_33BB0();
  }
}

unint64_t sub_1A018()
{
  unint64_t result = qword_457D0;
  if (!qword_457D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_457D0);
  }
  return result;
}

unint64_t sub_1A06C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  if (a1 == 0xD000000000000010 && a2 == 0x80000000000370D0) {
    return 0xD000000000000010;
  }
  if ((sub_33BB0() & 1) == 0)
  {
    if (v3 == 0xD000000000000017 && a2 == 0x80000000000370F0)
    {
      return 0xD000000000000017;
    }
    else if ((sub_33BB0() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  return v3;
}

uint64_t sub_1A154(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (v2)
  {
    uint64_t v4 = 0;
    uint64_t v5 = a2 + 32;
    do
    {
      uint64_t v6 = *(void **)(v5 + 8 * v4);
      if (v6)
      {
        if (a1 && ([v6 isEqual:a1] & 1) != 0) {
          return v4;
        }
      }
      else if (!a1)
      {
        return v4;
      }
      ++v4;
    }
    while (v2 != v4);
  }
  return 0;
}

uint64_t sub_1A1DC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_32A70();
  swift_release();
  swift_release();
  return v1;
}

double sub_1A254@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_32A70();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  return result;
}

uint64_t sub_1A2DC(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  swift_bridgeObjectRetain();
  swift_retain();
  id v4 = v1;
  return sub_32A80();
}

Swift::Int sub_1A370(void *a1)
{
  sub_33C30();
  if (a1)
  {
    id v2 = a1;
    Swift::UInt v3 = sub_33A10();
    sub_33C40(v3);
  }
  else
  {
    sub_33700();
  }
  return sub_33C50();
}

Swift::Int sub_1A3F0()
{
  return sub_1A370(*v0);
}

void sub_1A3F8()
{
  if (*v0)
  {
    id v2 = *v0;
    Swift::UInt v1 = sub_33A10();
    sub_33C40(v1);
  }
  else
  {
    sub_33700();
  }
}

Swift::Int sub_1A490()
{
  Swift::UInt v1 = *v0;
  sub_33C30();
  if (v1)
  {
    id v2 = v1;
    Swift::UInt v3 = sub_33A10();
    sub_33C40(v3);
  }
  else
  {
    sub_33700();
  }
  return sub_33C50();
}

id sub_1A50C@<X0>(void **a1@<X8>)
{
  id v2 = *v1;
  *a1 = *v1;
  return v2;
}

id sub_1A518(void **a1, void *a2)
{
  unint64_t v2 = (unint64_t)*a1;
  BOOL v3 = (v2 | *a2) == 0;
  if (v2) {
    BOOL v4 = *a2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    return objc_msgSend((id)v2, "isEqual:");
  }
  return (id)v3;
}

void sub_1A560(char *a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v10 = sub_5CC8(&qword_489F0);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v27 = a5;
    uint64_t v28 = a2;
    id v26 = a4;
    swift_bridgeObjectRetain_n();
    id v14 = a3;
    sub_5CC8(&qword_487B8);
    sub_E818(&qword_489F8, &qword_487B8);
    sub_20EEC();
    sub_336A0();
    sub_E818(&qword_48A08, &qword_489F0);
    sub_33840();
    sub_33890();
    if (v28 != v27)
    {
      uint64_t v27 = a5;
      sub_E818(&qword_48A10, &qword_487B8);
      sub_338D0();
      swift_bridgeObjectRelease_n();
      uint64_t v17 = v28;
      if (v28)
      {
        swift_bridgeObjectRelease();
        a5 = v17;
      }
      id v18 = v26;
      swift_bridgeObjectRetain();
      unint64_t v19 = sub_1A154((uint64_t)a4, a5);
      char v21 = v20;

      if (v21)
      {
        (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
        swift_bridgeObjectRelease();
        if (a1 == (unsigned char *)&dword_0 + 1) {
          return;
        }
        goto LABEL_13;
      }
      if ((v19 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (v19 < *(void *)(a5 + 16))
      {
        a4 = *(void **)(a5 + 8 * v19 + 32);
        id v22 = a4;

        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
        if (a1 == (unsigned char *)&dword_0 + 1) {
          return;
        }
        goto LABEL_13;
      }
      __break(1u);
      return;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    swift_bridgeObjectRelease_n();
    if (a1 == (unsigned char *)&dword_0 + 1) {
      return;
    }
  }
  else
  {
    id v15 = a4;
    swift_bridgeObjectRetain();
    id v16 = a3;
    if (a1 == (unsigned char *)&dword_0 + 1) {
      return;
    }
  }
LABEL_13:
  if (a3)
  {
    if (!a1)
    {

      uint64_t v23 = 0;
      goto LABEL_23;
    }
    uint64_t v23 = a1;
    if ([a3 isEqual:v23])
    {
      sub_20EDC(a1);
      return;
    }
LABEL_19:

LABEL_23:
    uint64_t v24 = v23;

    return;
  }
  if (a1)
  {
    uint64_t v23 = a1;
    goto LABEL_19;
  }
}

uint64_t sub_1A8F8(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  if (a2)
  {
    id v7 = a2;
    Swift::UInt v8 = sub_33A10();
    sub_33C40(v8);

    if (a3)
    {
LABEL_3:
      id v9 = a3;
      Swift::UInt v10 = sub_33A10();
      sub_33C40(v10);

      goto LABEL_6;
    }
  }
  else
  {
    sub_33700();
    if (a3) {
      goto LABEL_3;
    }
  }
  sub_33700();
LABEL_6:
  swift_bridgeObjectRetain();
  sub_206E0(a1, a4);

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1A9E0()
{
  Swift::UInt v1 = *(void **)v0;
  unint64_t v2 = *(void **)(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 16);
  sub_33C30();
  sub_1A8F8((uint64_t)v5, v1, v2, v3);
  return sub_33C50();
}

uint64_t sub_1AA3C(uint64_t a1)
{
  return sub_1A8F8(a1, *(void **)v1, *(void **)(v1 + 8), *(void *)(v1 + 16));
}

Swift::Int sub_1AA48()
{
  uint64_t v1 = *(void **)v0;
  unint64_t v2 = *(void **)(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 16);
  sub_33C30();
  sub_1A8F8((uint64_t)v5, v1, v2, v3);
  return sub_33C50();
}

uint64_t sub_1AAA0(uint64_t a1, uint64_t *a2)
{
  return sub_20894(*(void **)a1, *(void **)(a1 + 8), *(void *)(a1 + 16), *a2, a2[1], a2[2]);
}

uint64_t sub_1AABC()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_tasks)
                 + 16);
  if (v1)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = 0;
    do
    {
      ++v2;
      swift_retain();
      sub_33830();
      swift_release();
    }
    while (v1 != v2);
    swift_bridgeObjectRelease();
  }
  uint64_t v3 = v0 + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel__currentSnapshot;
  uint64_t v4 = sub_5CC8(&qword_489E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_2093C(*(void **)(v0 + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_pendingSnapshot), *(void **)(v0 + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_pendingSnapshot + 8), *(void *)(v0 + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_pendingSnapshot + 16));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_wallpaperTransitionObserver));
  sub_E7CC(*(void *)(v0
                     + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_addNewWallpaperAction));
  sub_E7CC(*(void *)(v0
                     + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_customizeWallpaperAction));
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1AC14()
{
  sub_1AABC();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_1AC6C()
{
  return type metadata accessor for PosterConfigurationCarouselViewModel();
}

uint64_t type metadata accessor for PosterConfigurationCarouselViewModel()
{
  uint64_t result = qword_48928;
  if (!qword_48928) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1ACC0()
{
  sub_1AD8C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_1AD8C()
{
  if (!qword_48938)
  {
    unint64_t v0 = sub_32A90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_48938);
    }
  }
}

uint64_t destroy for CarouselViewModelSnapshot(id *a1)
{
  return swift_bridgeObjectRelease();
}

void *_s17WallpaperSettings25CarouselViewModelSnapshotVwCP_0(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  a1[2] = *(void *)(a2 + 16);
  id v5 = v3;
  id v6 = v4;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CarouselViewModelSnapshot(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  Swift::UInt v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for CarouselViewModelSnapshot(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CarouselViewModelSnapshot(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CarouselViewModelSnapshot(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CarouselViewModelSnapshot(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CarouselViewModelSnapshot()
{
  return &type metadata for CarouselViewModelSnapshot;
}

uint64_t sub_1AFE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_5CC8(&qword_48378);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_5CC8(&qword_489E8);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  id v15 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = v4 + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel__currentSnapshot;
  uint64_t v59 = 0;
  uint64_t v60 = 0;
  uint64_t v61 = &off_41F88;
  sub_32A60();
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v16, v15, v12);
  uint64_t v17 = (void *)(v4 + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_pendingSnapshot);
  v17[1] = 0;
  v17[2] = 0;
  void *v17 = 0;
  *(unsigned char *)(v4 + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_enqueueSnapshotUpdates) = 0;
  uint64_t v18 = OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_wallpaperTransitionObserver;
  id v19 = objc_allocWithZone((Class)PRSWallpaperObserver);
  NSString v20 = sub_336D0();
  id v21 = [v19 initWithExplanation:v20];

  *(void *)(v4 + v18) = v21;
  id v22 = (uint64_t *)(v4 + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_addNewWallpaperAction);
  uint64_t *v22 = 0;
  v22[1] = 0;
  uint64_t v23 = (uint64_t *)(v4
                  + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_customizeWallpaperAction);
  uint64_t *v23 = 0;
  v23[1] = 0;
  *(void *)(v4 + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_tasks) = &_swiftEmptyArrayStorage;
  uint64_t v24 = *v22;
  uint64_t *v22 = a1;
  v22[1] = a2;
  uint64_t v57 = a1;
  uint64_t v58 = a2;
  sub_E7BC(a1);
  sub_E7CC(v24);
  uint64_t v25 = *v23;
  uint64_t *v23 = a3;
  v23[1] = a4;
  uint64_t v56 = a4;
  sub_E7BC(a3);
  sub_E7CC(v25);
  uint64_t v26 = sub_337D0();
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56);
  v27(v11, 1, 1, v26);
  uint64_t v28 = swift_allocObject();
  swift_weakInit();
  uint64_t v29 = (void *)swift_allocObject();
  void v29[2] = 0;
  v29[3] = 0;
  v29[4] = v28;
  uint64_t v30 = sub_964C((uint64_t)v11, (uint64_t)&unk_457E0, (uint64_t)v29);
  double v31 = sub_1FC2C(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
  unint64_t v33 = *((void *)v31 + 2);
  unint64_t v32 = *((void *)v31 + 3);
  if (v33 >= v32 >> 1) {
    double v31 = sub_1FC2C((char *)(v32 > 1), v33 + 1, 1, v31);
  }
  *((void *)v31 + 2) = v33 + 1;
  *(void *)&v31[8 * v33 + 32] = v30;
  v27(v11, 1, 1, v26);
  uint64_t v34 = swift_allocObject();
  swift_weakInit();
  uint64_t v35 = (void *)swift_allocObject();
  v35[2] = 0;
  v35[3] = 0;
  v35[4] = v34;
  uint64_t v36 = sub_964C((uint64_t)v11, (uint64_t)&unk_457F0, (uint64_t)v35);
  unint64_t v38 = *((void *)v31 + 2);
  unint64_t v37 = *((void *)v31 + 3);
  if (v38 >= v37 >> 1) {
    double v31 = sub_1FC2C((char *)(v37 > 1), v38 + 1, 1, v31);
  }
  *((void *)v31 + 2) = v38 + 1;
  *(void *)&v31[8 * v38 + 32] = v36;
  v27(v11, 1, 1, v26);
  uint64_t v39 = swift_allocObject();
  swift_weakInit();
  uint64_t v40 = (void *)swift_allocObject();
  v40[2] = 0;
  v40[3] = 0;
  v40[4] = v39;
  uint64_t v41 = sub_964C((uint64_t)v11, (uint64_t)&unk_45800, (uint64_t)v40);
  unint64_t v43 = *((void *)v31 + 2);
  unint64_t v42 = *((void *)v31 + 3);
  if (v43 >= v42 >> 1) {
    double v31 = sub_1FC2C((char *)(v42 > 1), v43 + 1, 1, v31);
  }
  *((void *)v31 + 2) = v43 + 1;
  *(void *)&v31[8 * v43 + 32] = v41;
  v27(v11, 1, 1, v26);
  uint64_t v44 = swift_allocObject();
  swift_weakInit();
  uint64_t v45 = (void *)swift_allocObject();
  v45[2] = 0;
  v45[3] = 0;
  v45[4] = v44;
  uint64_t v46 = sub_964C((uint64_t)v11, (uint64_t)&unk_45810, (uint64_t)v45);
  unint64_t v48 = *((void *)v31 + 2);
  unint64_t v47 = *((void *)v31 + 3);
  if (v48 >= v47 >> 1) {
    double v31 = sub_1FC2C((char *)(v47 > 1), v48 + 1, 1, v31);
  }
  *((void *)v31 + 2) = v48 + 1;
  *(void *)&v31[8 * v48 + 32] = v46;
  v27(v11, 1, 1, v26);
  uint64_t v49 = swift_allocObject();
  swift_weakInit();
  double v50 = (void *)swift_allocObject();
  v50[2] = 0;
  v50[3] = 0;
  v50[4] = v49;
  uint64_t v51 = sub_964C((uint64_t)v11, (uint64_t)&unk_45820, (uint64_t)v50);
  unint64_t v53 = *((void *)v31 + 2);
  unint64_t v52 = *((void *)v31 + 3);
  if (v53 >= v52 >> 1) {
    double v31 = sub_1FC2C((char *)(v52 > 1), v53 + 1, 1, v31);
  }
  *((void *)v31 + 2) = v53 + 1;
  *(void *)&v31[8 * v53 + 32] = v51;
  v27(v11, 1, 1, v26);
  double v54 = (void *)swift_allocObject();
  v54[2] = 0;
  v54[3] = 0;
  v54[4] = v4;
  v54[5] = v31;
  swift_retain();
  sub_964C((uint64_t)v11, (uint64_t)&unk_45830, (uint64_t)v54);
  sub_E7CC(a3);
  sub_E7CC(v57);
  swift_release();
  return v4;
}

uint64_t sub_1B6B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[8] = a4;
  uint64_t v5 = sub_5CC8(&qword_48A28);
  v4[9] = v5;
  v4[10] = *(void *)(v5 - 8);
  v4[11] = swift_task_alloc();
  uint64_t v6 = sub_5CC8(&qword_48A30);
  v4[12] = v6;
  v4[13] = *(void *)(v6 - 8);
  v4[14] = swift_task_alloc();
  uint64_t v7 = sub_5CC8(&qword_48A38);
  v4[15] = v7;
  v4[16] = *(void *)(v7 - 8);
  v4[17] = swift_task_alloc();
  return _swift_task_switch(sub_1B838, 0, 0);
}

uint64_t sub_1B838()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  v0[18] = Strong;
  if (Strong)
  {
    v0[19] = OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_wallpaperTransitionObserver;
    sub_337A0();
    v0[20] = sub_33790();
    uint64_t v3 = sub_33770();
    return _swift_task_switch(sub_1B954, v3, v2);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
}

uint64_t sub_1B954()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[18];
  swift_release();
  uint64_t v3 = *(void **)(v2 + v1);
  v0[21] = v3;
  id v4 = v3;
  swift_release();
  return _swift_task_switch(sub_1B9D4, 0, 0);
}

uint64_t sub_1B9D4()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[14];
  uint64_t v5 = v0[11];
  uint64_t v4 = v0[12];
  uint64_t v6 = v0[9];
  uint64_t v7 = v0[10];
  *(void *)(swift_task_alloc() + 16) = v1;
  (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))(v5, enum case for AsyncStream.Continuation.BufferingPolicy.unbounded<A>(_:), v6);
  sub_33820();
  swift_task_dealloc();
  sub_33800();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v4);
  swift_beginAccess();
  Swift::UInt v8 = (void *)swift_task_alloc();
  v0[22] = v8;
  void *v8 = v0;
  v8[1] = sub_1BB70;
  uint64_t v9 = v0[15];
  return AsyncStream.Iterator.next(isolation:)(v0 + 25, 0, 0, v9);
}

uint64_t sub_1BB70()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1BC6C, 0, 0);
}

uint64_t sub_1BC6C()
{
  if (*(unsigned char *)(v0 + 200))
  {
    uint64_t v1 = *(void **)(v0 + 168);
    (*(void (**)(void, void))(*(void *)(v0 + 128) + 8))(*(void *)(v0 + 136), *(void *)(v0 + 120));

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  else
  {
    uint64_t Strong = swift_weakLoadStrong();
    *(void *)(v0 + 184) = Strong;
    if (Strong)
    {
      uint64_t v5 = (void *)swift_task_alloc();
      *(void *)(v0 + 192) = v5;
      void *v5 = v0;
      v5[1] = sub_1BE0C;
      return sub_1BF9C();
    }
    else
    {
      uint64_t v6 = (void *)swift_task_alloc();
      *(void *)(v0 + 176) = v6;
      *uint64_t v6 = v0;
      v6[1] = sub_1BB70;
      uint64_t v7 = *(void *)(v0 + 120);
      return AsyncStream.Iterator.next(isolation:)(v0 + 200, 0, 0, v7);
    }
  }
}

uint64_t sub_1BE0C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 176) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_1BB70;
  uint64_t v4 = *(void *)(v1 + 120);
  return AsyncStream.Iterator.next(isolation:)(v1 + 200, 0, 0, v4);
}

uint64_t sub_1BF9C()
{
  v1[173] = v0;
  sub_337A0();
  v1[174] = sub_33790();
  uint64_t v3 = sub_33770();
  v1[175] = v3;
  v1[176] = v2;
  return _swift_task_switch(sub_1C038, v3, v2);
}

uint64_t sub_1C038()
{
  sub_20E94();
  swift_asyncLet_begin();
  sub_6E48(&qword_487B8);
  swift_asyncLet_begin();
  return _swift_asyncLet_get_throwing(v0 + 656, v0 + 1376, sub_1C12C, v0 + 1296);
}

uint64_t sub_1C12C()
{
  v1[177] = v0;
  if (v0) {
    return _swift_asyncLet_finish(v1 + 2, v1 + 171, sub_1C524, v1 + 162);
  }
  else {
    return _swift_task_switch(sub_1C170, v1[175], v1[176]);
  }
}

uint64_t sub_1C170()
{
  uint64_t v1 = *(void **)(v0 + 1376);
  *(void *)(v0 + 1424) = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  sub_32A70();
  swift_release();
  swift_release();
  *(_OWORD *)(v0 + 1432) = *(_OWORD *)(v0 + 1296);
  *(void *)(v0 + 1448) = *(void *)(v0 + 1312);
  id v3 = v2;
  return _swift_asyncLet_get_throwing(v0 + 16, v0 + 1368, sub_1C268, v0 + 1296);
}

uint64_t sub_1C268()
{
  v1[182] = v0;
  if (v0) {
    id v2 = sub_1C7A8;
  }
  else {
    id v2 = sub_1C2A0;
  }
  return _swift_task_switch(v2, v1[175], v1[176]);
}

uint64_t sub_1C2A0()
{
  uint64_t v1 = v0[181];
  id v2 = (void *)v0[180];
  id v3 = (void *)v0[179];
  uint64_t v4 = (char *)v0[178];
  uint64_t v5 = v0[173];
  uint64_t v6 = v0[171];
  swift_bridgeObjectRetain();
  sub_1A560(v4, v6, v3, v2, v1);
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v13 = v0[173];
  if (*(unsigned char *)(v5 + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_enqueueSnapshotUpdates) == 1)
  {
    uint64_t v14 = (void *)(v13 + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_pendingSnapshot);
    id v15 = *(void **)(v13 + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_pendingSnapshot);
    uint64_t v16 = *(void **)(v13 + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_pendingSnapshot + 8);
    uint64_t v17 = *(void *)(v13
                    + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_pendingSnapshot
                    + 16);
    *uint64_t v14 = v8;
    v14[1] = v10;
    v14[2] = v12;
    sub_2093C(v15, v16, v17);
    id v18 = v10;
    swift_bridgeObjectRetain();
    id v19 = v8;
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v0[162] = v8;
    v0[163] = v10;
    v0[164] = v12;
    id v18 = v10;
    swift_bridgeObjectRetain();
    swift_retain();
    id v19 = v8;
    sub_32A80();
  }
  NSString v20 = (void *)v0[178];

  swift_bridgeObjectRelease();
  return _swift_asyncLet_finish(v0 + 2, v0 + 171, sub_1C46C, v0 + 162);
}

uint64_t sub_1C46C()
{
  return _swift_task_switch(sub_1C488, *(void *)(v0 + 1400), *(void *)(v0 + 1408));
}

uint64_t sub_1C488()
{
  return _swift_asyncLet_finish(v0 + 656, v0 + 1376, sub_1C4A8, v0 + 16);
}

uint64_t sub_1C4A8()
{
  return _swift_task_switch(sub_1C4C4, *(void *)(v0 + 1400), *(void *)(v0 + 1408));
}

uint64_t sub_1C4C4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1C524()
{
  return _swift_task_switch(sub_1C540, *(void *)(v0 + 1400), *(void *)(v0 + 1408));
}

uint64_t sub_1C540()
{
  return _swift_asyncLet_finish(v0 + 656, v0 + 1376, sub_1C560, v0 + 16);
}

uint64_t sub_1C560()
{
  return _swift_task_switch(sub_1C57C, *(void *)(v0 + 1400), *(void *)(v0 + 1408));
}

uint64_t sub_1C57C()
{
  uint64_t v10 = v0;
  swift_release();
  if (qword_48350 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_32A10();
  sub_6CA4(v1, (uint64_t)qword_4A418);
  swift_errorRetain();
  swift_errorRetain();
  id v2 = sub_329F0();
  os_log_type_t v3 = sub_338F0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136446210;
    swift_getErrorValue();
    uint64_t v5 = sub_33BE0();
    *(void *)(v0 + 16) = sub_1FEFC(v5, v6, &v9);
    sub_33A30();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v3, "Error during call into PosterBoardServices %{public}s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_1C7A8()
{
  uint64_t v1 = (void *)v0[180];
  id v2 = (void *)v0[179];
  os_log_type_t v3 = (void *)v0[178];

  swift_bridgeObjectRelease();
  return _swift_asyncLet_finish(v0 + 2, v0 + 171, sub_1C858, v0 + 162);
}

uint64_t sub_1C858()
{
  return _swift_task_switch(sub_1C874, *(void *)(v0 + 1400), *(void *)(v0 + 1408));
}

uint64_t sub_1C874()
{
  return _swift_asyncLet_finish(v0 + 656, v0 + 1376, sub_1C894, v0 + 16);
}

uint64_t sub_1C894()
{
  return _swift_task_switch(sub_1C8B0, *(void *)(v0 + 1400), *(void *)(v0 + 1408));
}

uint64_t sub_1C8B0()
{
  uint64_t v10 = v0;
  swift_release();
  if (qword_48350 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_32A10();
  sub_6CA4(v1, (uint64_t)qword_4A418);
  swift_errorRetain();
  swift_errorRetain();
  id v2 = sub_329F0();
  os_log_type_t v3 = sub_338F0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136446210;
    swift_getErrorValue();
    uint64_t v5 = sub_33BE0();
    *(void *)(v0 + 16) = sub_1FEFC(v5, v6, &v9);
    sub_33A30();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v3, "Error during call into PosterBoardServices %{public}s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_1CADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a4;
  sub_5CC8(&qword_48450);
  v4[7] = swift_task_alloc();
  uint64_t v5 = sub_339B0();
  v4[8] = v5;
  v4[9] = *(void *)(v5 - 8);
  v4[10] = swift_task_alloc();
  return _swift_task_switch(sub_1CBCC, 0, 0);
}

uint64_t sub_1CBCC()
{
  id v1 = [self defaultCenter];
  sub_339C0();

  sub_339A0();
  swift_beginAccess();
  unint64_t v2 = sub_A78C();
  os_log_type_t v3 = (void *)swift_task_alloc();
  v0[11] = v3;
  *os_log_type_t v3 = v0;
  v3[1] = sub_1CCF4;
  uint64_t v4 = v0[7];
  uint64_t v5 = v0[8];
  return dispatch thunk of AsyncIteratorProtocol.next()(v4, v5, v2);
}

uint64_t sub_1CCF4()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0) {
    unint64_t v2 = sub_1CFE0;
  }
  else {
    unint64_t v2 = sub_1CE08;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1CE08()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = sub_32820();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
    swift_task_dealloc();
    swift_task_dealloc();
    os_log_type_t v3 = (uint64_t (*)(void))v0[1];
    return v3();
  }
  else
  {
    uint64_t Strong = swift_weakLoadStrong();
    v0[13] = Strong;
    if (Strong)
    {
      unint64_t v6 = (void *)swift_task_alloc();
      v0[14] = v6;
      *unint64_t v6 = v0;
      v6[1] = sub_1D064;
      return sub_1BF9C();
    }
    else
    {
      sub_6D44(v0[7], &qword_48450);
      unint64_t v7 = sub_A78C();
      uint64_t v8 = (void *)swift_task_alloc();
      v0[11] = v8;
      void *v8 = v0;
      v8[1] = sub_1CCF4;
      uint64_t v9 = v0[7];
      uint64_t v10 = v0[8];
      return dispatch thunk of AsyncIteratorProtocol.next()(v9, v10, v7);
    }
  }
}

uint64_t sub_1CFE0()
{
  *(void *)(v0 + 40) = *(void *)(v0 + 96);
  sub_5CC8(&qword_48460);
  uint64_t v1 = swift_dynamicCast();
  return _swift_willThrowTypedImpl(v1, &type metadata for Never, &protocol witness table for Never);
}

uint64_t sub_1D064()
{
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_1D17C, 0, 0);
}

uint64_t sub_1D17C()
{
  sub_6D44(v0[7], &qword_48450);
  unint64_t v1 = sub_A78C();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[11] = (uint64_t)v2;
  void *v2 = v0;
  v2[1] = sub_1CCF4;
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[8];
  return dispatch thunk of AsyncIteratorProtocol.next()(v3, v4, v1);
}

uint64_t sub_1D234(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[9] = a4;
  sub_5CC8(&qword_48450);
  v4[10] = swift_task_alloc();
  uint64_t v5 = sub_339B0();
  v4[11] = v5;
  v4[12] = *(void *)(v5 - 8);
  v4[13] = swift_task_alloc();
  return _swift_task_switch(sub_1D324, 0, 0);
}

uint64_t sub_1D324()
{
  id v1 = [self defaultCenter];
  if (qword_48320 != -1) {
    swift_once();
  }
  sub_339C0();

  sub_339A0();
  swift_beginAccess();
  unint64_t v2 = sub_A78C();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[14] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1D478;
  uint64_t v4 = v0[10];
  uint64_t v5 = v0[11];
  return dispatch thunk of AsyncIteratorProtocol.next()(v4, v5, v2);
}

uint64_t sub_1D478()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0) {
    unint64_t v2 = sub_1D768;
  }
  else {
    unint64_t v2 = sub_1D58C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1D58C()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = sub_32820();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(v0[12] + 8))(v0[13], v0[11]);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = (uint64_t (*)(void))v0[1];
    return v3();
  }
  else
  {
    uint64_t Strong = swift_weakLoadStrong();
    v0[16] = Strong;
    if (Strong)
    {
      sub_337A0();
      v0[17] = sub_33790();
      uint64_t v7 = sub_33770();
      return _swift_task_switch(sub_1D7EC, v7, v6);
    }
    else
    {
      sub_6D44(v0[10], &qword_48450);
      unint64_t v8 = sub_A78C();
      uint64_t v9 = (void *)swift_task_alloc();
      v0[14] = v9;
      void *v9 = v0;
      v9[1] = sub_1D478;
      uint64_t v10 = v0[10];
      uint64_t v11 = v0[11];
      return dispatch thunk of AsyncIteratorProtocol.next()(v10, v11, v8);
    }
  }
}

uint64_t sub_1D768()
{
  *(void *)(v0 + 64) = *(void *)(v0 + 120);
  sub_5CC8(&qword_48460);
  uint64_t v1 = swift_dynamicCast();
  return _swift_willThrowTypedImpl(v1, &type metadata for Never, &protocol witness table for Never);
}

uint64_t sub_1D7EC()
{
  uint64_t v1 = v0[16];
  swift_release();
  uint64_t v2 = v1 + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_pendingSnapshot;
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_pendingSnapshot);
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_pendingSnapshot + 8);
  uint64_t v5 = *(void *)(v2 + 16);
  if (v5)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v0[5] = v3;
    v0[6] = v4;
    v0[7] = v5;
    sub_21088(v3, v4, v5);
    swift_retain();
    sub_32A80();
    uint64_t v6 = *(void **)v2;
    uint64_t v7 = *(void **)(v2 + 8);
    uint64_t v8 = *(void *)(v2 + 16);
    *(void *)(v2 + 8) = 0;
    *(void *)(v2 + 16) = 0;
    *(void *)uint64_t v2 = 0;
  }
  else
  {
    *(unsigned char *)(v0[16] + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_enqueueSnapshotUpdates) = 0;
    uint64_t v6 = *(void **)v2;
    uint64_t v7 = *(void **)(v2 + 8);
    uint64_t v8 = *(void *)(v2 + 16);
    *(void *)uint64_t v2 = v3;
    *(void *)(v2 + 8) = v4;
    *(void *)(v2 + 16) = 0;
  }
  sub_2093C(v6, v7, v8);
  swift_release();
  return _swift_task_switch(sub_1D920, 0, 0);
}

uint64_t sub_1D920()
{
  sub_6D44(v0[10], &qword_48450);
  unint64_t v1 = sub_A78C();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[14] = (uint64_t)v2;
  void *v2 = v0;
  v2[1] = sub_1D478;
  uint64_t v3 = v0[10];
  uint64_t v4 = v0[11];
  return dispatch thunk of AsyncIteratorProtocol.next()(v3, v4, v1);
}

uint64_t sub_1D9D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a4;
  sub_5CC8(&qword_48450);
  v4[7] = swift_task_alloc();
  uint64_t v5 = sub_339B0();
  v4[8] = v5;
  v4[9] = *(void *)(v5 - 8);
  v4[10] = swift_task_alloc();
  return _swift_task_switch(sub_1DAC8, 0, 0);
}

uint64_t sub_1DAC8()
{
  id v1 = [self defaultCenter];
  if (qword_48328 != -1) {
    swift_once();
  }
  sub_339C0();

  sub_339A0();
  swift_beginAccess();
  unint64_t v2 = sub_A78C();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[11] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1DC1C;
  uint64_t v4 = v0[7];
  uint64_t v5 = v0[8];
  return dispatch thunk of AsyncIteratorProtocol.next()(v4, v5, v2);
}

uint64_t sub_1DC1C()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0) {
    unint64_t v2 = sub_21364;
  }
  else {
    unint64_t v2 = sub_1DD30;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1DD30()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = sub_32820();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = (uint64_t (*)(void))v0[1];
    return v3();
  }
  else
  {
    uint64_t Strong = swift_weakLoadStrong();
    v0[13] = Strong;
    if (Strong)
    {
      uint64_t v6 = (void *)swift_task_alloc();
      v0[14] = v6;
      *uint64_t v6 = v0;
      v6[1] = sub_1DF08;
      return sub_1BF9C();
    }
    else
    {
      sub_6D44(v0[7], &qword_48450);
      unint64_t v7 = sub_A78C();
      uint64_t v8 = (void *)swift_task_alloc();
      v0[11] = v8;
      void *v8 = v0;
      v8[1] = sub_1DC1C;
      uint64_t v9 = v0[7];
      uint64_t v10 = v0[8];
      return dispatch thunk of AsyncIteratorProtocol.next()(v9, v10, v7);
    }
  }
}

uint64_t sub_1DF08()
{
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_1E020, 0, 0);
}

uint64_t sub_1E020()
{
  sub_6D44(v0[7], &qword_48450);
  unint64_t v1 = sub_A78C();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[11] = (uint64_t)v2;
  void *v2 = v0;
  v2[1] = sub_1DC1C;
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[8];
  return dispatch thunk of AsyncIteratorProtocol.next()(v3, v4, v1);
}

uint64_t sub_1E0D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a4;
  sub_5CC8(&qword_48450);
  v4[7] = swift_task_alloc();
  uint64_t v5 = sub_339B0();
  v4[8] = v5;
  v4[9] = *(void *)(v5 - 8);
  v4[10] = swift_task_alloc();
  return _swift_task_switch(sub_1E1C8, 0, 0);
}

uint64_t sub_1E1C8()
{
  id v1 = [self defaultCenter];
  if (qword_48340 != -1) {
    swift_once();
  }
  sub_339C0();

  sub_339A0();
  swift_beginAccess();
  unint64_t v2 = sub_A78C();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[11] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1E31C;
  uint64_t v4 = v0[7];
  uint64_t v5 = v0[8];
  return dispatch thunk of AsyncIteratorProtocol.next()(v4, v5, v2);
}

uint64_t sub_1E31C()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0) {
    unint64_t v2 = sub_21364;
  }
  else {
    unint64_t v2 = sub_1E430;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1E430()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = sub_32820();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = (uint64_t (*)(void))v0[1];
    return v3();
  }
  else
  {
    uint64_t Strong = swift_weakLoadStrong();
    v0[13] = Strong;
    if (Strong)
    {
      uint64_t v6 = (void *)swift_task_alloc();
      v0[14] = v6;
      *uint64_t v6 = v0;
      v6[1] = sub_1E608;
      return sub_1BF9C();
    }
    else
    {
      sub_6D44(v0[7], &qword_48450);
      unint64_t v7 = sub_A78C();
      uint64_t v8 = (void *)swift_task_alloc();
      v0[11] = v8;
      void *v8 = v0;
      v8[1] = sub_1E31C;
      uint64_t v9 = v0[7];
      uint64_t v10 = v0[8];
      return dispatch thunk of AsyncIteratorProtocol.next()(v9, v10, v7);
    }
  }
}

uint64_t sub_1E608()
{
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_1E720, 0, 0);
}

uint64_t sub_1E720()
{
  sub_6D44(v0[7], &qword_48450);
  unint64_t v1 = sub_A78C();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[11] = (uint64_t)v2;
  void *v2 = v0;
  v2[1] = sub_1E31C;
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[8];
  return dispatch thunk of AsyncIteratorProtocol.next()(v3, v4, v1);
}

uint64_t sub_1E7D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return _swift_task_switch(sub_1E7F8, 0, 0);
}

uint64_t sub_1E7F8()
{
  sub_337A0();
  *(void *)(v0 + 32) = sub_33790();
  uint64_t v2 = sub_33770();
  return _swift_task_switch(sub_1E88C, v2, v1);
}

uint64_t sub_1E88C()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[2];
  swift_release();
  *(void *)(v2 + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_tasks) = v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_1E918(uint64_t a1)
{
  *(void *)(v1 + 128) = a1;
  return _swift_task_switch(sub_1E938, 0, 0);
}

uint64_t sub_1E938()
{
  if (qword_48338 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)qword_4A3D8;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_1EA6C;
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_1EC08;
  v0[13] = &unk_42FF8;
  v0[14] = v2;
  [v1 fetchActivePosterForRole:0 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_1EA6C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 136) = v1;
  if (v1) {
    uint64_t v2 = sub_21368;
  }
  else {
    uint64_t v2 = sub_1EB7C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1EB7C()
{
  uint64_t v1 = (void *)v0[15];
  uint64_t v2 = (void *)v0[16];
  id v3 = [v1 lockScreenPosterConfiguration];

  void *v2 = v3;
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1EC08(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_5CC8(&qword_48460);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return _swift_continuation_throwingResume(a1);
  }
}

uint64_t sub_1ECC8(uint64_t a1)
{
  *(void *)(v1 + 128) = a1;
  return _swift_task_switch(sub_1ECE8, 0, 0);
}

uint64_t sub_1ECE8()
{
  if (qword_48338 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)qword_4A3D8;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_1EE1C;
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_1F1A0;
  v0[13] = &unk_42FE0;
  v0[14] = v2;
  [v1 fetchPosterConfigurationsForRole:0 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_1EE1C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 136) = v1;
  if (v1) {
    uint64_t v2 = sub_1F134;
  }
  else {
    uint64_t v2 = sub_1EF2C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1EF2C()
{
  unint64_t v1 = v0[15];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_33B70();
    swift_bridgeObjectRelease();
    if (!v2) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
    if (!v2) {
      goto LABEL_13;
    }
  }
  uint64_t result = sub_20554(0, v2 & ~(v2 >> 63), 0);
  if (v2 < 0)
  {
    __break(1u);
    return result;
  }
  for (uint64_t i = 0; i != v2; ++i)
  {
    if ((v1 & 0xC000000000000001) != 0) {
      id v5 = (id)sub_33AB0();
    }
    else {
      id v5 = *(id *)(v1 + 8 * i + 32);
    }
    id v6 = v5;
    unint64_t v8 = *((void *)&_swiftEmptyArrayStorage + 2);
    unint64_t v7 = *((void *)&_swiftEmptyArrayStorage + 3);
    if (v8 >= v7 >> 1) {
      sub_20554(v7 > 1, v8 + 1, 1);
    }
    *((void *)&_swiftEmptyArrayStorage + 2) = v8 + 1;
    *((void *)&_swiftEmptyArrayStorage + v8 + 4) = v6;
  }
LABEL_13:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v9 = (char *)&_swiftEmptyArrayStorage;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v9 = sub_1FD3C(0, *((void *)&_swiftEmptyArrayStorage + 2) + 1, 1, (char *)&_swiftEmptyArrayStorage);
  }
  unint64_t v11 = *((void *)v9 + 2);
  unint64_t v10 = *((void *)v9 + 3);
  if (v11 >= v10 >> 1) {
    uint64_t v9 = sub_1FD3C((char *)(v10 > 1), v11 + 1, 1, v9);
  }
  uint64_t v12 = (char **)v0[16];
  *((void *)v9 + 2) = v11 + 1;
  *(void *)&v9[8 * v11 + 32] = 0;
  swift_bridgeObjectRelease();
  void *v12 = v9;
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_1F134()
{
  swift_willThrow();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1F1A0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_5CC8(&qword_48460);
    uint64_t v5 = swift_allocError();
    *id v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    sub_20E94();
    **(void **)(*(void *)(v3 + 64) + 40) = sub_33760();
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_1F26C()
{
  uint64_t v0 = sub_5CC8(&qword_48378);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v8 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_32A70();
  swift_release();
  swift_release();

  id v3 = v8[2];
  uint64_t result = swift_bridgeObjectRelease();
  if (v3)
  {
    uint64_t v5 = sub_337D0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 1, 1, v5);
    id v6 = (void *)swift_allocObject();
    v6[2] = 0;
    v6[3] = 0;
    v6[4] = v3;
    id v7 = v3;
    sub_1F920((uint64_t)v2, (uint64_t)&unk_45868, (uint64_t)v6);

    swift_release();
    return sub_6D44((uint64_t)v2, &qword_48378);
  }
  return result;
}

uint64_t sub_1F3E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 152) = a4;
  return _swift_task_switch(sub_1F400, 0, 0);
}

uint64_t sub_1F400()
{
  if (qword_48338 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[19];
  uint64_t v2 = (void *)qword_4A3D8;
  v0[2] = v0;
  v0[3] = sub_1F534;
  uint64_t v3 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_1F888;
  v0[13] = &unk_430F0;
  v0[14] = v3;
  [v2 updateSelectedForRoleIdentifier:0 newlySelectedConfiguration:v1 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_1F534()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 160) = v1;
  if (v1) {
    uint64_t v2 = sub_1F658;
  }
  else {
    uint64_t v2 = sub_1F644;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1F644()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1F658()
{
  uint64_t v10 = v0;
  swift_willThrow();
  if (qword_48350 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_32A10();
  sub_6CA4(v1, (uint64_t)qword_4A418);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_329F0();
  os_log_type_t v3 = sub_338F0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    swift_getErrorValue();
    uint64_t v5 = sub_33BE0();
    *(void *)(v0 + 80) = sub_1FEFC(v5, v6, &v9);
    sub_33A30();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v3, "Failed to update wallpaper with error: %s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  id v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_1F888(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    sub_5CC8(&qword_48460);
    uint64_t v4 = swift_allocError();
    void *v5 = a2;
    id v6 = a2;
    return _swift_continuation_throwingResumeWithError(v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return _swift_continuation_throwingResume(v7);
  }
}

uint64_t sub_1F920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_5CC8(&qword_48378);
  __chkstk_darwin(v6 - 8);
  unint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_212C4(a1, (uint64_t)v8);
  uint64_t v9 = sub_337D0();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_6D44((uint64_t)v8, &qword_48378);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v11 = sub_33770();
      uint64_t v13 = v12;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_337C0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = 0;
  uint64_t v13 = 0;
LABEL_6:
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  if (v13 | v11)
  {
    v16[0] = 0;
    v16[1] = 0;
    void v16[2] = v11;
    v16[3] = v13;
  }
  return swift_task_create();
}

uint64_t sub_1FB0C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_32A50();
  *a1 = result;
  return result;
}

uint64_t sub_1FB5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    os_log_type_t v3 = (void **)(a1 + 32);
    uint64_t v4 = (uint64_t *)(a2 + 32);
    do
    {
      uint64_t v6 = *v3++;
      uint64_t v5 = v6;
      uint64_t v8 = *v4++;
      uint64_t v7 = v8;
      if (v5)
      {
        if (!v7 || (objc_msgSend(v5, "isEqual:") & 1) == 0) {
          return 0;
        }
      }
      else if (v7)
      {
        return 0;
      }
      --v2;
    }
    while (v2);
  }
  return 1;
}

uint64_t sub_1FBE0(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1FBF0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

char *sub_1FC2C(char *result, int64_t a2, char a3, char *a4)
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
      sub_5CC8(&qword_45850);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 3);
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
        if (v10 != a4 || v13 >= &a4[8 * v8 + 32]) {
          memmove(v13, a4 + 32, 8 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_20788(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_1FD3C(char *result, int64_t a2, char a3, char *a4)
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
      sub_5CC8(&qword_48A20);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 3);
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
        if (v10 != a4 || v13 >= &a4[8 * v8 + 32]) {
          memmove(v13, a4 + 32, 8 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_20F94(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unsigned char **sub_1FE4C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_1FE5C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1FE84(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_1FEFC(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_33A30();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1FEFC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1FFD0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_6328((uint64_t)v12, *a3);
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
      sub_6328((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_20F40((uint64_t)v12);
  return v7;
}

uint64_t sub_1FFD0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_33A40();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2018C(a5, a6);
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
  uint64_t v8 = sub_33AC0();
  if (!v8)
  {
    sub_33B50();
    __break(1u);
LABEL_17:
    uint64_t result = sub_33B90();
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

uint64_t sub_2018C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_20224(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_20404(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_20404(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_20224(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2039C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_33AA0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_33B50();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_33730();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_33B90();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_33B50();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_2039C(uint64_t a1, uint64_t a2)
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
  sub_5CC8(&qword_48A18);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_20404(char a1, int64_t a2, char a3, char *a4)
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
    sub_5CC8(&qword_48A18);
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
  uint64_t result = sub_33B90();
  __break(1u);
  return result;
}

uint64_t sub_20554(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_20574(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_20574(char a1, int64_t a2, char a3, char *a4)
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
    sub_5CC8(&qword_48A20);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_33B90();
  __break(1u);
  return result;
}

void sub_206E0(uint64_t a1, uint64_t a2)
{
  Swift::UInt v3 = *(void *)(a2 + 16);
  sub_33C40(v3);
  if (v3)
  {
    unint64_t v4 = (void **)(a2 + 32);
    do
    {
      while (1)
      {
        uint64_t v8 = *v4++;
        int64_t v7 = v8;
        if (!v8) {
          break;
        }
        id v5 = v7;
        Swift::UInt v6 = sub_33A10();
        sub_33C40(v6);

        if (!--v3) {
          return;
        }
      }
      sub_33700();
      --v3;
    }
    while (v3);
  }
}

uint64_t sub_20788(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      sub_5CC8(&qword_45858);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_33B90();
  __break(1u);
  return result;
}

uint64_t sub_20894(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1)
  {
    if (!a4 || ([a1 isEqual:a4] & 1) == 0) {
      return 0;
    }
  }
  else if (a4)
  {
    return 0;
  }
  if (!a2)
  {
    if (!a5) {
      goto LABEL_9;
    }
    return 0;
  }
  if (!a5 || ([a2 isEqual:a5] & 1) == 0) {
    return 0;
  }
LABEL_9:

  return sub_1FB5C(a3, a6);
}

void sub_2093C(void *a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_20990()
{
  swift_weakDestroy();

  return swift_deallocObject();
}

uint64_t sub_209CC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_719C;
  return sub_1B6B4(a1, v4, v5, v6);
}

uint64_t sub_20A84(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_66C8;
  return sub_1CADC(a1, v4, v5, v6);
}

uint64_t sub_20B3C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_719C;
  return sub_1D234(a1, v4, v5, v6);
}

uint64_t sub_20BF4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_719C;
  return sub_1D9D8(a1, v4, v5, v6);
}

uint64_t sub_20CAC()
{
  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_20CEC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_719C;
  return sub_1E0D8(a1, v4, v5, v6);
}

uint64_t sub_20DA0()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_20DE8()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_719C;
  *(_OWORD *)(v2 + 16) = v3;
  return _swift_task_switch(sub_1E7F8, 0, 0);
}

unint64_t sub_20E94()
{
  unint64_t result = qword_48380;
  if (!qword_48380)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_48380);
  }
  return result;
}

void sub_20EDC(id a1)
{
  if (a1 != (char *)&dword_0 + 1) {
}
  }

unint64_t sub_20EEC()
{
  unint64_t result = qword_48A00;
  if (!qword_48A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48A00);
  }
  return result;
}

uint64_t sub_20F40(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_20F94(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_33B90();
  __break(1u);
  return result;
}

id sub_21088(id result, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = result;
    id v3 = a2;
    swift_bridgeObjectRetain();
    return v4;
  }
  return result;
}

void sub_210DC(uint64_t a1)
{
  sub_2CC30(a1, *(void **)(v1 + 16));
}

uint64_t getEnumTagSinglePayload for CarouselViewModelSnapshot.CarouselItem(uint64_t *a1, unsigned int a2)
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
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CarouselViewModelSnapshot.CarouselItem(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = 0;
    *(_DWORD *)uint64_t result = a2 - 0x7FFFFFFF;
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

uint64_t sub_21188(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_211A0(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *uint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for CarouselViewModelSnapshot.CarouselItem()
{
  return &type metadata for CarouselViewModelSnapshot.CarouselItem;
}

uint64_t sub_211D8()
{
  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_21218()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_719C;
  v3[19] = v2;
  return _swift_task_switch(sub_1F400, 0, 0);
}

uint64_t sub_212C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5CC8(&qword_48378);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2132C()
{
  swift_release();

  return swift_deallocObject();
}

ValueMetadata *type metadata accessor for PosterConfigurationCarousel()
{
  return &type metadata for PosterConfigurationCarousel;
}

uint64_t sub_2137C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21398@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v3 = sub_330E0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_5CC8(&qword_48A40);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_5CC8(&qword_48A48);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_5CC8(&qword_48A50);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v9 = sub_32FA0();
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  uint64_t v17 = sub_5CC8(&qword_48A58);
  sub_21700((uint64_t *)&v9[*(int *)(v17 + 44)]);
  sub_21914((uint64_t)v9, (uint64_t)v12);
  id v18 = &v12[*(int *)(v10 + 36)];
  v18[32] = 0;
  *(_OWORD *)id v18 = 0u;
  *((_OWORD *)v18 + 1) = 0u;
  sub_6D44((uint64_t)v9, &qword_48A40);
  sub_330D0();
  sub_2197C();
  sub_21A40(&qword_48A80, (void (*)(uint64_t))&type metadata accessor for BorderlessButtonStyle);
  sub_33370();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_6D44((uint64_t)v12, &qword_48A48);
  type metadata accessor for PosterConfigurationCarouselViewModel();
  sub_21A40((unint64_t *)&qword_483B8, (void (*)(uint64_t))type metadata accessor for PosterConfigurationCarouselViewModel);
  uint64_t v19 = v24;
  swift_retain();
  uint64_t v20 = sub_32A40();
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 16))(a2, v16, v13);
  id v21 = (uint64_t *)(a2 + *(int *)(sub_5CC8(&qword_48A88) + 36));
  *id v21 = v20;
  v21[1] = v19;
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t sub_21700@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for WallpaperConfigurationsCarouselContent();
  uint64_t v3 = (int *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  unint64_t v6 = (uint64_t *)((char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v21 - v7;
  type metadata accessor for PosterConfigurationCarouselViewModel();
  sub_21A40((unint64_t *)&qword_483B8, (void (*)(uint64_t))type metadata accessor for PosterConfigurationCarouselViewModel);
  uint64_t v9 = sub_32DA0();
  uint64_t v11 = v10;
  *unint64_t v6 = swift_getKeyPath();
  sub_5CC8(&qword_486D0);
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = (uint64_t *)((char *)v6 + v3[7]);
  uint64_t *v12 = sub_32DA0();
  v12[1] = v13;
  uint64_t v14 = (char *)v6 + v3[8];
  *(void *)uint64_t v14 = swift_getKeyPath();
  *((void *)v14 + 1) = 0;
  v14[16] = 0;
  *(uint64_t *)((char *)v6 + v3[9]) = 0x403C000000000000;
  *(int64x2_t *)((char *)v6 + v3[10]) = vdupq_n_s64(0x4049000000000000uLL);
  sub_13B78((uint64_t)v6, (uint64_t)v8);
  uint64_t v15 = sub_32DA0();
  uint64_t v17 = v16;
  sub_13B10((uint64_t)v8, (uint64_t)v6);
  *a1 = v9;
  a1[1] = v11;
  uint64_t v18 = sub_5CC8(&qword_48A90);
  sub_13B10((uint64_t)v6, (uint64_t)a1 + *(int *)(v18 + 48));
  uint64_t v19 = (uint64_t *)((char *)a1 + *(int *)(v18 + 64));
  *uint64_t v19 = v15;
  v19[1] = v17;
  swift_retain();
  swift_retain();
  sub_21B80((uint64_t)v8);
  swift_release();
  sub_21B80((uint64_t)v6);
  return swift_release();
}

uint64_t sub_2190C@<X0>(uint64_t a1@<X8>)
{
  return sub_21398(*(void *)(v1 + 8), a1);
}

uint64_t sub_21914(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5CC8(&qword_48A40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_2197C()
{
  unint64_t result = qword_48A60;
  if (!qword_48A60)
  {
    sub_6E48(&qword_48A48);
    sub_E818(&qword_48A68, &qword_48A40);
    sub_E818(&qword_48A70, &qword_48A78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48A60);
  }
  return result;
}

uint64_t sub_21A40(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_21A88()
{
  return sub_32E20();
}

uint64_t sub_21AAC(uint64_t a1)
{
  uint64_t v2 = sub_32C60();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_32E30();
}

uint64_t sub_21B80(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for WallpaperConfigurationsCarouselContent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21BE0()
{
  unint64_t result = qword_48A98;
  if (!qword_48A98)
  {
    sub_6E48(&qword_48A88);
    sub_6E48(&qword_48A48);
    sub_330E0();
    sub_2197C();
    sub_21A40(&qword_48A80, (void (*)(uint64_t))&type metadata accessor for BorderlessButtonStyle);
    swift_getOpaqueTypeConformance2();
    sub_E818(&qword_48AA0, &qword_48AA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48A98);
  }
  return result;
}

void sub_21D04()
{
  id v0 = [self mainScreen];
  [v0 bounds];
  uint64_t v2 = v1;
  uint64_t v4 = v3;

  *(void *)&xmmword_45870 = v2;
  *((void *)&xmmword_45870 + 1) = v4;
}

double sub_21D70@<D0>(_OWORD *a1@<X8>)
{
  if (qword_451B0 != -1) {
    swift_once();
  }
  double result = *(double *)&xmmword_45870;
  *a1 = xmmword_45870;
  return result;
}

uint64_t sub_21DD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_22044(&qword_45890, type metadata accessor for CGSize);

  return static EnvironmentKey<>._valuesEqual(_:_:)(a1, a2, a3, a4, v8);
}

double sub_21E64()
{
  sub_21FD0();
  sub_32EF0();
  return v1;
}

void sub_21EA0(void *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_21EAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_22044(&qword_45238, type metadata accessor for BSInterfaceOrientation);

  return static EnvironmentKey<>._valuesEqual(_:_:)(a1, a2, a3, a4, v8);
}

uint64_t sub_21F40()
{
  sub_21F7C();
  sub_32EF0();
  return v1;
}

unint64_t sub_21F7C()
{
  unint64_t result = qword_45880;
  if (!qword_45880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_45880);
  }
  return result;
}

unint64_t sub_21FD0()
{
  unint64_t result = qword_45888;
  if (!qword_45888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_45888);
  }
  return result;
}

ValueMetadata *type metadata accessor for ScreenSizeEnvironmentKey()
{
  return &type metadata for ScreenSizeEnvironmentKey;
}

ValueMetadata *type metadata accessor for InterfaceOrientationEnvironmentKey()
{
  return &type metadata for InterfaceOrientationEnvironmentKey;
}

uint64_t sub_22044(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2208C()
{
  uint64_t v0 = sub_32A10();
  sub_221E8(v0, qword_466E8);
  sub_6CA4(v0, (uint64_t)qword_466E8);
  swift_bridgeObjectRetain();
  return sub_32A00();
}

uint64_t sub_22114(uint64_t a1)
{
  return sub_22160(a1, qword_4A400);
}

uint64_t sub_2213C(uint64_t a1)
{
  return sub_22160(a1, qword_4A418);
}

uint64_t sub_22160(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_32A10();
  sub_221E8(v3, a2);
  sub_6CA4(v3, (uint64_t)a2);
  swift_bridgeObjectRetain();
  return sub_32A00();
}

uint64_t *sub_221E8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_2224C()
{
  uint64_t v0 = sub_32990();
  sub_221E8(v0, qword_4A430);
  sub_6CA4(v0, (uint64_t)qword_4A430);
  return sub_32980();
}

ValueMetadata *type metadata accessor for WallpaperConfigurationsCarouselHeader()
{
  return &type metadata for WallpaperConfigurationsCarouselHeader;
}

uint64_t sub_222E0()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 sub_222FC@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v19 = a17;
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
    sub_33900();
    uint64_t v28 = (void *)sub_331D0();
    sub_32930();

    uint64_t v19 = a17;
  }
  sub_32D40();
  sub_FB0C(v17, a9, a16);
  uint64_t v29 = (_OWORD *)(a9 + *(int *)(sub_5CC8(v19) + 36));
  v29[4] = v35;
  v29[5] = v36;
  v29[6] = v37;
  _OWORD *v29 = v31;
  v29[1] = v32;
  __n128 result = v34;
  void v29[2] = v33;
  v29[3] = v34;
  return result;
}

uint64_t sub_224CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v43 = a3;
  uint64_t v5 = sub_5CC8(&qword_48AB0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_5CC8(&qword_48AB8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_5CC8(&qword_48AC0);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_5CC8(&qword_48AC8);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_5CC8(&qword_48AD0);
  uint64_t v18 = v17 - 8;
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v16 = sub_32FA0();
  *((void *)v16 + 1) = 0;
  v16[16] = 1;
  uint64_t v21 = (uint64_t)&v16[*(int *)(sub_5CC8(&qword_48AD8) + 44)];
  uint64_t v22 = a2;
  sub_22888(a1, (uint64_t)v7);
  sub_FB0C((uint64_t)v7, (uint64_t)v10, &qword_48AB0);
  sub_6D44((uint64_t)v7, &qword_48AB0);
  uint64_t v23 = sub_335D0();
  sub_222FC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v13, 0.0, 1, 0.0, 1, v23, v24, &qword_48AB8, &qword_48AC0);
  sub_6D44((uint64_t)v10, &qword_48AB8);
  uint64_t v25 = sub_335D0();
  uint64_t v27 = v26;
  uint64_t v28 = v21 + *(int *)(sub_5CC8(&qword_48AE0) + 36);
  sub_22DFC(a1, v22, v28);
  uint64_t v29 = (uint64_t *)(v28 + *(int *)(sub_5CC8(&qword_48AE8) + 36));
  uint64_t *v29 = v25;
  v29[1] = v27;
  sub_15198((uint64_t)v13, v21, &qword_48AC0);
  LOBYTE(v13) = sub_33230();
  sub_32AC0();
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  sub_FB0C((uint64_t)v16, (uint64_t)v20, &qword_48AC8);
  unint64_t v38 = &v20[*(int *)(v18 + 44)];
  *unint64_t v38 = (char)v13;
  *((void *)v38 + 1) = v31;
  *((void *)v38 + 2) = v33;
  *((void *)v38 + 3) = v35;
  *((void *)v38 + 4) = v37;
  v38[40] = 0;
  sub_6D44((uint64_t)v16, &qword_48AC8);
  uint64_t v39 = sub_335D0();
  sub_222FC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v43, 0.0, 1, 0.0, 1, v39, v40, &qword_48AD0, &qword_48AF0);
  return sub_6D44((uint64_t)v20, &qword_48AD0);
}

uint64_t sub_22888@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v48 = a2;
  uint64_t v40 = sub_5CC8(&qword_48B90);
  __chkstk_darwin(v40);
  uint64_t v4 = (uint64_t *)((char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_5CC8(&qword_48B98);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_5CC8(&qword_48B80);
  __chkstk_darwin(v39);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_5CC8(&qword_48B68);
  __chkstk_darwin(v44);
  uint64_t v43 = (uint64_t)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_5CC8(&qword_48BA0);
  uint64_t v46 = *(void *)(v11 - 8);
  uint64_t v47 = v11;
  __chkstk_darwin(v11);
  uint64_t v45 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_5CC8(&qword_48AB0);
  __chkstk_darwin(v41);
  uint64_t v42 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23994(a1);
  sub_32F30();
  if (qword_48330 != -1) {
    swift_once();
  }
  id v14 = (id)qword_4A3D0;
  uint64_t v15 = sub_33300();
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  char v21 = v20 & 1;
  uint64_t v22 = enum case for Text.Case.uppercase(_:);
  uint64_t v23 = sub_332D0();
  uint64_t v24 = *(void *)(v23 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 104))(v7, v22, v23);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v7, 0, 1, v23);
  uint64_t KeyPath = swift_getKeyPath();
  sub_FB0C((uint64_t)v7, (uint64_t)v4 + *(int *)(v40 + 28), &qword_48B98);
  *uint64_t v4 = KeyPath;
  sub_FB0C((uint64_t)v4, (uint64_t)&v9[*(int *)(v39 + 36)], &qword_48B90);
  *(void *)uint64_t v9 = v15;
  *((void *)v9 + 1) = v17;
  v9[16] = v21;
  *((void *)v9 + 3) = v19;
  sub_FB70(v15, v17, v21);
  swift_bridgeObjectRetain();
  sub_6D44((uint64_t)v4, &qword_48B90);
  sub_6D44((uint64_t)v7, &qword_48B98);
  sub_8C94(v15, v17, v21);
  swift_bridgeObjectRelease();
  uint64_t v26 = sub_33290();
  uint64_t v27 = swift_getKeyPath();
  uint64_t v28 = v43;
  sub_FB0C((uint64_t)v9, v43, &qword_48B80);
  uint64_t v29 = (uint64_t *)(v28 + *(int *)(v44 + 36));
  uint64_t *v29 = v27;
  v29[1] = v26;
  sub_6D44((uint64_t)v9, &qword_48B80);
  sub_33270();
  sub_240B4();
  uint64_t v30 = v45;
  sub_33360();
  sub_6D44(v28, &qword_48B68);
  uint64_t v31 = sub_33450();
  uint64_t v32 = swift_getKeyPath();
  uint64_t v34 = v46;
  uint64_t v33 = v47;
  uint64_t v35 = (uint64_t)v42;
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v42, v30, v47);
  uint64_t v36 = (uint64_t *)(v35 + *(int *)(v41 + 36));
  *uint64_t v36 = v32;
  v36[1] = v31;
  (*(void (**)(char *, uint64_t))(v34 + 8))(v30, v33);
  return sub_15198(v35, v48, &qword_48AB0);
}

uint64_t sub_22DFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v30 = a3;
  uint64_t v5 = sub_5CC8(&qword_48AB0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_5CC8(&qword_48AF8);
  uint64_t v8 = __chkstk_darwin(v29);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v27 - v11;
  uint64_t v13 = sub_5CC8(&qword_48B00);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_5CC8(&qword_48B08);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_5CC8(&qword_48B10);
  uint64_t v19 = __chkstk_darwin(v28);
  char v21 = (char *)&v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v27 - v22;
  if (sub_231DC(a1))
  {
    sub_233E4(a1, a2, (uint64_t)v18);
    sub_FB0C((uint64_t)v18, (uint64_t)v21, &qword_48B08);
    sub_6D44((uint64_t)v18, &qword_48B08);
    sub_15198((uint64_t)v21, (uint64_t)v23, &qword_48B10);
    sub_FB0C((uint64_t)v23, (uint64_t)v15, &qword_48B10);
    swift_storeEnumTagMultiPayload();
    sub_23F60(&qword_48B18, &qword_48B10, (void (*)(void))sub_23D24);
    sub_23F60(&qword_48B58, &qword_48AF8, (void (*)(void))sub_23FE0);
    sub_330A0();
    uint64_t v24 = (uint64_t)v23;
    uint64_t v25 = &qword_48B10;
  }
  else
  {
    sub_22888(a1, (uint64_t)v7);
    sub_FB0C((uint64_t)v7, (uint64_t)v10, &qword_48AB0);
    sub_6D44((uint64_t)v7, &qword_48AB0);
    sub_15198((uint64_t)v10, (uint64_t)v12, &qword_48AF8);
    sub_FB0C((uint64_t)v12, (uint64_t)v15, &qword_48AF8);
    swift_storeEnumTagMultiPayload();
    sub_23F60(&qword_48B18, &qword_48B10, (void (*)(void))sub_23D24);
    sub_23F60(&qword_48B58, &qword_48AF8, (void (*)(void))sub_23FE0);
    sub_330A0();
    uint64_t v24 = (uint64_t)v12;
    uint64_t v25 = &qword_48AF8;
  }
  return sub_6D44(v24, v25);
}

uint64_t sub_231DC(uint64_t a1)
{
  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_32A70();
    swift_release();
    swift_release();
    swift_release();

    swift_bridgeObjectRelease();
    if (v4)
    {

      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_32A70();
      swift_release();
      swift_release();
      swift_release();

      swift_bridgeObjectRelease();
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_32A70();
      swift_release();
      swift_release();
      swift_release();

      swift_bridgeObjectRelease();
      if (v3)
      {
        unsigned int v1 = [v4 isEqual:v3];

        return v1 ^ 1;
      }
      else
      {

        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    type metadata accessor for PosterConfigurationCarouselViewModel();
    sub_2446C((unint64_t *)&qword_483B8, (void (*)(uint64_t))type metadata accessor for PosterConfigurationCarouselViewModel);
    uint64_t result = sub_32D80();
    __break(1u);
  }
  return result;
}

uint64_t sub_233E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v44 = a2;
  uint64_t v53 = a3;
  uint64_t v4 = sub_32AF0();
  uint64_t v51 = *(void *)(v4 - 8);
  uint64_t v52 = v4;
  __chkstk_darwin(v4);
  double v50 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_32D60();
  uint64_t v48 = *(void *)(v6 - 8);
  uint64_t v49 = v6;
  __chkstk_darwin(v6);
  uint64_t v47 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_32F90();
  uint64_t v45 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  uint64_t v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_5CC8(&qword_48B38);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_5CC8(&qword_458A8);
  uint64_t v14 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  uint64_t v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_5CC8(&qword_48B30);
  uint64_t v18 = v17 - 8;
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = swift_allocObject();
  uint64_t v22 = v44;
  *(void *)(v21 + 16) = a1;
  *(void *)(v21 + 24) = v22;
  swift_retain();
  sub_334C0();
  sub_32F80();
  sub_E818(&qword_48B40, &qword_48B38);
  sub_2446C(&qword_48B48, (void (*)(uint64_t))&type metadata accessor for BorderedButtonStyle);
  uint64_t v23 = v43;
  sub_33370();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v9, v23);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v24 = v47;
  sub_32D50();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v26 = (uint64_t *)&v20[*(int *)(v18 + 44)];
  uint64_t v27 = sub_5CC8(&qword_48670);
  uint64_t v28 = v48;
  uint64_t v29 = v24;
  uint64_t v30 = v24;
  uint64_t v31 = v49;
  (*(void (**)(char *, char *, uint64_t))(v48 + 16))((char *)v26 + *(int *)(v27 + 28), v29, v49);
  uint64_t *v26 = KeyPath;
  uint64_t v32 = v46;
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v20, v16, v46);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v31);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v32);
  uint64_t v34 = v50;
  uint64_t v33 = v51;
  uint64_t v35 = v52;
  (*(void (**)(char *, void, uint64_t))(v51 + 104))(v50, enum case for ControlSize.small(_:), v52);
  uint64_t v36 = swift_getKeyPath();
  uint64_t v37 = sub_5CC8(&qword_48B08);
  uint64_t v38 = v53;
  uint64_t v39 = (uint64_t *)(v53 + *(int *)(v37 + 36));
  uint64_t v40 = sub_5CC8(&qword_48678);
  (*(void (**)(char *, char *, uint64_t))(v33 + 16))((char *)v39 + *(int *)(v40 + 28), v34, v35);
  *uint64_t v39 = v36;
  sub_FB0C((uint64_t)v20, v38, &qword_48B30);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v35);
  return sub_6D44((uint64_t)v20, &qword_48B30);
}

uint64_t sub_23994(uint64_t a1)
{
  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_32A70();
    swift_release();
    swift_release();
    swift_release();

    swift_bridgeObjectRelease();
    if (!v5) {
      return 0;
    }

    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_32A70();
    swift_release();
    swift_release();
    swift_release();

    unsigned int v1 = v5;
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_32A70();
    swift_release();
    swift_release();
    swift_release();

    swift_bridgeObjectRelease();
    if (v4)
    {
      id v2 = [v5 isEqual:v4];

      unsigned int v1 = v4;
    }
    else
    {
      id v2 = 0;
    }

    return (uint64_t)v2;
  }
  else
  {
    type metadata accessor for PosterConfigurationCarouselViewModel();
    sub_2446C((unint64_t *)&qword_483B8, (void (*)(uint64_t))type metadata accessor for PosterConfigurationCarouselViewModel);
    uint64_t result = sub_32D80();
    __break(1u);
  }
  return result;
}

uint64_t sub_23BA4(uint64_t a1)
{
  if (a1)
  {
    swift_retain();
    sub_1F26C();
    return swift_release();
  }
  else
  {
    type metadata accessor for PosterConfigurationCarouselViewModel();
    sub_2446C((unint64_t *)&qword_483B8, (void (*)(uint64_t))type metadata accessor for PosterConfigurationCarouselViewModel);
    uint64_t result = sub_32D80();
    __break(1u);
  }
  return result;
}

uint64_t sub_23C3C@<X0>(uint64_t a1@<X8>)
{
  sub_32F30();
  if (qword_48330 != -1) {
    swift_once();
  }
  id v2 = (id)qword_4A3D0;
  uint64_t result = sub_33300();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_23D1C@<X0>(uint64_t a1@<X8>)
{
  return sub_224CC(*v1, v1[1], a1);
}

unint64_t sub_23D24()
{
  unint64_t result = qword_48B20;
  if (!qword_48B20)
  {
    sub_6E48(&qword_48B08);
    sub_23DC4();
    sub_E818(&qword_48698, &qword_48678);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48B20);
  }
  return result;
}

unint64_t sub_23DC4()
{
  unint64_t result = qword_48B28;
  if (!qword_48B28)
  {
    sub_6E48(&qword_48B30);
    sub_6E48(&qword_48B38);
    sub_32F90();
    sub_E818(&qword_48B40, &qword_48B38);
    sub_2446C(&qword_48B48, (void (*)(uint64_t))&type metadata accessor for BorderedButtonStyle);
    swift_getOpaqueTypeConformance2();
    sub_E818(&qword_48690, &qword_48670);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48B28);
  }
  return result;
}

unint64_t sub_23F0C()
{
  unint64_t result = qword_48B50;
  if (!qword_48B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48B50);
  }
  return result;
}

uint64_t sub_23F60(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_6E48(a2);
    a3();
    sub_23F0C();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23FE0()
{
  unint64_t result = qword_48B60;
  if (!qword_48B60)
  {
    sub_6E48(&qword_48AB0);
    sub_6E48(&qword_48B68);
    sub_240B4();
    swift_getOpaqueTypeConformance2();
    sub_E818(&qword_48658, &qword_48660);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48B60);
  }
  return result;
}

unint64_t sub_240B4()
{
  unint64_t result = qword_48B70;
  if (!qword_48B70)
  {
    sub_6E48(&qword_48B68);
    sub_24154();
    sub_E818(&qword_486A8, &qword_486B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48B70);
  }
  return result;
}

unint64_t sub_24154()
{
  unint64_t result = qword_48B78;
  if (!qword_48B78)
  {
    sub_6E48(&qword_48B80);
    sub_E818(&qword_48B88, &qword_48B90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48B78);
  }
  return result;
}

uint64_t sub_241F4()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2422C()
{
  return sub_23BA4(*(void *)(v0 + 16));
}

uint64_t sub_24234()
{
  return sub_32E40();
}

uint64_t sub_24258()
{
  return sub_32E40();
}

uint64_t sub_2427C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2435C(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for ButtonBorderShape, (uint64_t (*)(char *))&EnvironmentValues._buttonBorderShape.setter);
}

uint64_t sub_242A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2435C(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for ButtonBorderShape, (uint64_t (*)(char *))&EnvironmentValues._buttonBorderShape.setter);
}

uint64_t sub_242E8()
{
  return sub_32DD0();
}

uint64_t sub_2430C()
{
  return sub_32DD0();
}

uint64_t sub_24330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2435C(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for ControlSize, (uint64_t (*)(char *))&EnvironmentValues.controlSize.setter);
}

uint64_t sub_2435C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_2442C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2435C(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for ControlSize, (uint64_t (*)(char *))&EnvironmentValues.controlSize.setter);
}

uint64_t sub_2446C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_244BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_32E50();
  *a1 = result;
  return result;
}

uint64_t sub_244E8()
{
  return sub_32E60();
}

uint64_t sub_24514@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_32E00();
  *a1 = result;
  return result;
}

uint64_t sub_24540()
{
  return sub_32E10();
}

uint64_t sub_2456C()
{
  return sub_32E70();
}

uint64_t sub_24590(uint64_t a1)
{
  uint64_t v2 = sub_5CC8(&qword_48B98);
  __chkstk_darwin(v2 - 8);
  sub_FB0C(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_48B98);
  return sub_32E80();
}

uint64_t sub_24628@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_32E50();
  *a1 = result;
  return result;
}

uint64_t sub_24654()
{
  return sub_32E60();
}

uint64_t sub_24680@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_32E00();
  *a1 = result;
  return result;
}

uint64_t sub_246AC()
{
  return sub_32E10();
}

unint64_t sub_246DC()
{
  unint64_t result = qword_48BA8;
  if (!qword_48BA8)
  {
    sub_6E48(&qword_48AF0);
    sub_24758();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48BA8);
  }
  return result;
}

unint64_t sub_24758()
{
  unint64_t result = qword_48BB0;
  if (!qword_48BB0)
  {
    sub_6E48(&qword_48AD0);
    sub_E818(&qword_48BB8, &qword_48AC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48BB0);
  }
  return result;
}

ValueMetadata *type metadata accessor for WallpaperConfigurationsCarouselFooter()
{
  return &type metadata for WallpaperConfigurationsCarouselFooter;
}

uint64_t sub_24808()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24824@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  type metadata accessor for PosterConfigurationCarouselViewModel();
  sub_E764();
  sub_32D70();
  swift_getKeyPath();
  sub_32D90();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_5CC8(&qword_48798);
  sub_33550();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_32A70();
    swift_release();
    swift_release();
    swift_release();

    uint64_t v4 = sub_32DA0();
    uint64_t v14 = v5;
    uint64_t v6 = sub_335D0();
    uint64_t v8 = v7;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_32A70();
    swift_release();
    swift_release();
    swift_release();

    swift_bridgeObjectRelease();
    if (v19)
    {

      uint64_t v9 = sub_32DA0();
      uint64_t v11 = v10;
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v9 = 1;
    }
    *a2 = v15;
    a2[1] = v16;
    a2[2] = v17;
    a2[3] = v20;
    a2[4] = v4;
    a2[5] = v14;
    a2[6] = v9;
    a2[7] = v11;
    a2[8] = v6;
    a2[9] = v8;
    swift_retain();
    swift_retain();
    swift_retain();
    id v12 = v17;
    swift_bridgeObjectRetain();
    sub_24BC0(v9);
    swift_release();
    sub_24BD0(v9);
    swift_bridgeObjectRelease();

    swift_release();
    return swift_release();
  }
  else
  {
    uint64_t result = sub_32D80();
    __break(1u);
  }
  return result;
}

uint64_t sub_24AF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = sub_32FA0();
  sub_24824(v3, v17);
  long long v15 = v17[1];
  long long v16 = v17[0];
  long long v13 = v17[3];
  long long v14 = v17[2];
  uint64_t v5 = v18;
  uint64_t v6 = v19;
  char v7 = sub_33230();
  uint64_t result = sub_32AC0();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = 0x4034000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  *(_OWORD *)(a1 + 24) = v16;
  *(_OWORD *)(a1 + 40) = v15;
  *(_OWORD *)(a1 + 56) = v14;
  *(_OWORD *)(a1 + 72) = v13;
  *(void *)(a1 + 88) = v5;
  *(void *)(a1 + 96) = v6;
  *(unsigned char *)(a1 + 104) = v7;
  *(void *)(a1 + 112) = v9;
  *(void *)(a1 + 120) = v10;
  *(void *)(a1 + 128) = v11;
  *(void *)(a1 + 136) = v12;
  *(unsigned char *)(a1 + 144) = 0;
  return result;
}

uint64_t sub_24BC0(uint64_t result)
{
  if (result != 1) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_24BD0(uint64_t result)
{
  if (result != 1) {
    return swift_release();
  }
  return result;
}

unint64_t sub_24BE4()
{
  unint64_t result = qword_48BC0;
  if (!qword_48BC0)
  {
    sub_6E48(&qword_48BC8);
    sub_24C60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48BC0);
  }
  return result;
}

unint64_t sub_24C60()
{
  unint64_t result = qword_48BD0;
  if (!qword_48BD0)
  {
    sub_6E48(&qword_48BD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48BD0);
  }
  return result;
}

ValueMetadata *type metadata accessor for NewWallpaperItemLockScreenWell()
{
  return &type metadata for NewWallpaperItemLockScreenWell;
}

uint64_t sub_24CCC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t *a4@<X8>)
{
  uint64_t v8 = sub_32BF0();
  uint64_t v9 = v8 - 8;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_337D0();
  uint64_t v37 = *(void *)(v12 - 8);
  uint64_t v13 = v37;
  uint64_t v38 = v12;
  __chkstk_darwin(v12);
  long long v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_335D0();
  uint64_t v39 = v17;
  uint64_t v40 = v16;
  char v18 = a3 & 1;
  sub_24F8C(v43);
  uint64_t v35 = v43[2];
  uint64_t v36 = v43[1];
  uint64_t v19 = v43[5];
  uint64_t v33 = v43[4];
  uint64_t v34 = v43[3];
  uint64_t v41 = v43[6];
  uint64_t v42 = v43[0];
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a1;
  *(void *)(v20 + 24) = a2;
  *(unsigned char *)(v20 + 32) = v18;
  sub_7B54();
  sub_337B0();
  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  uint64_t v22 = v15;
  uint64_t v23 = v38;
  v21(&v11[*(int *)(v9 + 28)], v15, v38);
  *(void *)uint64_t v11 = &unk_458B8;
  *((void *)v11 + 1) = v20;
  uint64_t v24 = sub_5CC8(&qword_48BE0);
  sub_89FC((uint64_t)v11, (uint64_t)a4 + *(int *)(v24 + 36));
  uint64_t v25 = v41;
  uint64_t v26 = v39;
  *a4 = v40;
  a4[1] = v26;
  uint64_t v28 = v35;
  uint64_t v27 = v36;
  a4[2] = v42;
  a4[3] = v27;
  uint64_t v30 = v33;
  uint64_t v29 = v34;
  a4[4] = v28;
  a4[5] = v29;
  a4[6] = v30;
  a4[7] = v19;
  a4[8] = v25;
  a4[9] = 0;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_8A60((uint64_t)v11);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v22, v23);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24F8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_5CC8(&qword_486C0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_33490();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = [self systemGray5Color];
  uint64_t v10 = sub_33460();
  type metadata accessor for NewWallpaperItemWellViewModel();
  sub_25750(&qword_48410, (void (*)(uint64_t))type metadata accessor for NewWallpaperItemWellViewModel);
  sub_32B10();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_32A70();
  swift_release();
  swift_release();
  swift_release();
  if (v21)
  {
    id v11 = v21;
    sub_33470();
    (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for Image.ResizingMode.stretch(_:), v5);
    uint64_t v12 = sub_334B0();

    swift_release();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v13 = sub_33480();
  uint64_t v14 = sub_33440();
  uint64_t v15 = sub_33420();
  uint64_t v16 = sub_33260();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v4, 1, 1, v16);
  sub_33280();
  sub_25560((uint64_t)v4);
  uint64_t v17 = sub_33250();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  *a1 = v10;
  a1[1] = v12;
  a1[2] = v13;
  a1[3] = v14;
  a1[4] = v15;
  a1[5] = KeyPath;
  a1[6] = v17;
  swift_retain();
  return swift_release();
}

uint64_t sub_252C8(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v3 + 72) = a3;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a2;
  sub_337A0();
  *(void *)(v3 + 32) = sub_33790();
  uint64_t v5 = sub_33770();
  *(void *)(v3 + 40) = v5;
  *(void *)(v3 + 48) = v4;
  return _swift_task_switch(sub_25364, v5, v4);
}

uint64_t sub_25364()
{
  type metadata accessor for NewWallpaperItemWellViewModel();
  sub_25750(&qword_48410, (void (*)(uint64_t))type metadata accessor for NewWallpaperItemWellViewModel);
  *(void *)(v0 + 56) = sub_32B10();
  unsigned int v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  void *v1 = v0;
  v1[1] = sub_8768;
  return sub_2BF14(0);
}

uint64_t sub_25468@<X0>(uint64_t *a1@<X8>)
{
  return sub_24CE8(*(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16), a1);
}

uint64_t sub_25474()
{
  sub_7B6C();

  return swift_deallocObject();
}

uint64_t sub_254B0()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  char v4 = *(unsigned char *)(v0 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_66C8;
  return sub_252C8(v2, v3, v4);
}

uint64_t sub_25560(uint64_t a1)
{
  uint64_t v2 = sub_5CC8(&qword_486C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_255CC()
{
  unint64_t result = qword_48BE8;
  if (!qword_48BE8)
  {
    sub_6E48(&qword_48BE0);
    sub_25678();
    sub_25750(&qword_452E8, (void (*)(uint64_t))&type metadata accessor for _TaskModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48BE8);
  }
  return result;
}

unint64_t sub_25678()
{
  unint64_t result = qword_48BF0;
  if (!qword_48BF0)
  {
    sub_6E48(&qword_48BF8);
    sub_256F4();
    sub_8C40();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48BF0);
  }
  return result;
}

unint64_t sub_256F4()
{
  unint64_t result = qword_48C00;
  if (!qword_48C00)
  {
    sub_6E48(&qword_48C08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48C00);
  }
  return result;
}

uint64_t sub_25750(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25798(unint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, uint64_t a10, double (*a11)(double))
{
  uint64_t v53 = a11;
  LODWORD(v57) = a4;
  double v58 = *(double *)&a3;
  LODWORD(v54) = a2;
  unint64_t v55 = a1;
  uint64_t v16 = sub_32BE0();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v56 = (char *)&v50 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_32C20();
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v59 = (char *)&v50 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_5CC8(&qword_48490);
  __chkstk_darwin(v22 - 8);
  uint64_t v24 = (char *)&v50 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_5CC8(&qword_458D0);
  uint64_t v26 = v25 - 8;
  uint64_t v27 = ((uint64_t (*)(uint64_t))__chkstk_darwin)(v25);
  uint64_t v29 = (char *)&v50 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  uint64_t v31 = (char *)&v50 - v30;
  v62.origin.x = a6;
  v62.origin.y = a7;
  v62.size.width = a8;
  v62.size.height = a9;
  CGFloat Width = CGRectGetWidth(v62);
  double v33 = v53(Width);
  v63.origin.x = a6;
  v63.origin.y = a7;
  v63.size.width = a8;
  v63.size.height = a9;
  v34.n128_f64[0] = CGRectGetWidth(v63);
  if (LOBYTE(v54)) {
    unint64_t v35 = v34.n128_u64[0];
  }
  else {
    unint64_t v35 = v55;
  }
  double v36 = v33;
  if ((v57 & 1) == 0) {
    double v36 = v58;
  }
  double v54 = v36;
  unint64_t v55 = v35;
  uint64_t v52 = (void (**)(char *, uint64_t))v20;
  uint64_t v57 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v20 + 16);
  *(void *)&double v58 = v20 + 16;
  v57(v29, a5, v19, v34);
  sub_25FC8();
  sub_33840();
  *(void *)&v29[*(int *)(v26 + 44)] = v61[0];
  sub_26020((uint64_t)v29, (uint64_t)v31);
  uint64_t v37 = &v31[*(int *)(v26 + 44)];
  uint64_t v38 = *(void *)v37;
  sub_33890();
  if (v38 == v61[0])
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v24, 1, 1, v16);
  }
  else
  {
    ++v52;
    uint64_t v53 = (double (*)(double))(v17 + 16);
    uint64_t v39 = v17;
    uint64_t v40 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
    uint64_t v41 = (unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48);
    double v50 = (void (**)(char *, uint64_t))(v39 + 8);
    uint64_t v51 = (void (**)(char *, char *, uint64_t))(v39 + 32);
    while (1)
    {
      uint64_t v42 = (void (*)(uint64_t *, void))sub_338C0();
      (*(void (**)(char *))v53)(v24);
      v42(v61, 0);
      uint64_t v43 = v59;
      ((void (*)(char *, char *, uint64_t))v57)(v59, v31, v19);
      sub_338A0();
      (*v52)(v43, v19);
      uint64_t v44 = *v40;
      (*v40)(v24, 0, 1, v16);
      if ((*v41)(v24, 1, v16) == 1) {
        break;
      }
      uint64_t v45 = v56;
      (*v51)(v56, v24, v16);
      sub_33600();
      LOBYTE(v61[0]) = 0;
      char v60 = 0;
      sub_32BD0();
      (*v50)(v45, v16);
      uint64_t v46 = v31;
      uint64_t v47 = *(void *)v37;
      sub_33890();
      BOOL v48 = v47 == v61[0];
      uint64_t v31 = v46;
      if (v48)
      {
        v44(v24, 1, 1, v16);
        return sub_26088((uint64_t)v31);
      }
    }
  }
  return sub_26088((uint64_t)v31);
}

double sub_25C78(uint64_t a1, char a2, double a3, __n128 a4)
{
  double v5 = *(double *)v4;
  if ((a2 & 1) == 0 && a1 != 0x7FF0000000000000 && (a1 & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    double v5 = *(double *)&a1;
    a4.n128_u64[0] = *(void *)(v4 + 8);
    (*(void (**)(double, __n128))(v4 + 16))(*(double *)&a1, a4);
  }
  return v5;
}

uint64_t sub_25CD4(unint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10)
{
  return sub_25798(a1, a2 & 1, a3, a4 & 1, a5, a7, a8, a9, a10, a6, *(double (**)(double))(v10 + 16));
}

unint64_t ProposedViewSize.debugDescription.getter()
{
  sub_33A90(38);
  swift_bridgeObjectRelease();
  sub_5CC8(&qword_458C0);
  v1._countAndFlagsBits = sub_336F0();
  sub_33720(v1);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = 0x746867696568202CLL;
  v2._object = (void *)0xEA0000000000203ALL;
  sub_33720(v2);
  v3._countAndFlagsBits = sub_336F0();
  sub_33720(v3);
  swift_bridgeObjectRelease();
  return 0xD000000000000018;
}

unint64_t sub_25DF8()
{
  return ProposedViewSize.debugDescription.getter();
}

uint64_t destroy for HeightFromWidthLayout()
{
  return swift_release();
}

uint64_t initializeWithCopy for HeightFromWidthLayout(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  return a1;
}

void *assignWithCopy for HeightFromWidthLayout(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v3 = a2[3];
  a1[2] = a2[2];
  a1[3] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for HeightFromWidthLayout(_OWORD *a1, _OWORD *a2)
{
  long long v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for HeightFromWidthLayout(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HeightFromWidthLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HeightFromWidthLayout()
{
  return &type metadata for HeightFromWidthLayout;
}

unint64_t sub_25F74()
{
  unint64_t result = qword_458C8;
  if (!qword_458C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_458C8);
  }
  return result;
}

unint64_t sub_25FC8()
{
  unint64_t result = qword_48498;
  if (!qword_48498)
  {
    sub_32C20();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48498);
  }
  return result;
}

uint64_t sub_26020(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5CC8(&qword_458D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_26088(uint64_t a1)
{
  uint64_t v2 = sub_5CC8(&qword_458D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *sub_260E8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_5CC8(&qword_48C10);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_32C40();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    id v11 = (uint64_t *)((char *)a2 + v9);
    uint64_t v12 = v11[1];
    void *v10 = *v11;
    v10[1] = v12;
  }
  swift_retain();
  return a1;
}

uint64_t sub_2620C(uint64_t a1)
{
  sub_5CC8(&qword_48C10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_32C40();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }

  return swift_release();
}

void *sub_262B0(void *a1, void *a2, uint64_t a3)
{
  sub_5CC8(&qword_48C10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_32C40();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  uint64_t v10 = v9[1];
  void *v8 = *v9;
  v8[1] = v10;
  swift_retain();
  return a1;
}

void *sub_26388(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_26484((uint64_t)a1);
    sub_5CC8(&qword_48C10);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_32C40();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  void *v8 = *v9;
  v8[1] = v9[1];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_26484(uint64_t a1)
{
  uint64_t v2 = sub_5CC8(&qword_48C10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_264E4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_5CC8(&qword_48C10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_32C40();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_265B8(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_26484((uint64_t)a1);
    uint64_t v6 = sub_5CC8(&qword_48C10);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_32C40();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v12 = *(void *)v10;
  uint64_t v11 = *((void *)v10 + 1);
  *(void *)uint64_t v9 = v12;
  *((void *)v9 + 1) = v11;
  swift_release();
  return a1;
}

uint64_t sub_266AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_266C0);
}

uint64_t sub_266C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_5CC8((uint64_t *)&unk_458D8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_26788(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_2679C);
}

uint64_t sub_2679C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_5CC8((uint64_t *)&unk_458D8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for PosterGestureTutorialView()
{
  uint64_t result = qword_48C70;
  if (!qword_48C70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_268AC()
{
  sub_26940();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_26940()
{
  if (!qword_48C80)
  {
    sub_32C40();
    unint64_t v0 = sub_32B00();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_48C80);
    }
  }
}

uint64_t sub_26998()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_269B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v13 = sub_32FB0();
  sub_26B08((uint64_t)v14);
  uint64_t v2 = v14[0];
  uint64_t v3 = v14[1];
  char v4 = v15;
  uint64_t v5 = v16;
  uint64_t v6 = v18;
  char v7 = v19;
  uint64_t v11 = v17;
  uint64_t v12 = v20;
  type metadata accessor for PosterGestureTutorialView();
  type metadata accessor for WallpaperAutobahnViewModel();
  sub_26F38();
  swift_retain();
  uint64_t v8 = sub_32C30();
  *(void *)a1 = v13;
  *(void *)(a1 + 8) = 0x4018000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = v2;
  *(void *)(a1 + 32) = v3;
  *(unsigned char *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = v5;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v6;
  *(unsigned char *)(a1 + 72) = v7;
  *(void *)(a1 + 80) = v12;
  *(void *)(a1 + 88) = v8;
  *(void *)(a1 + 96) = v9;
  sub_FB70(v2, v3, v4);
  swift_bridgeObjectRetain();
  sub_FB70(v11, v6, v7);
  swift_bridgeObjectRetain();
  sub_8C94(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_8C94(v11, v6, v7);

  return swift_bridgeObjectRelease();
}

uint64_t sub_26B08@<X0>(uint64_t a1@<X8>)
{
  sub_32F30();
  if (qword_48330 != -1) {
    swift_once();
  }
  id v2 = (id)qword_4A3D0;
  uint64_t v3 = sub_33300();
  uint64_t v5 = v4;
  char v7 = v6 & 1;
  sub_33240();
  uint64_t v8 = sub_332F0();
  uint64_t v10 = v9;
  char v12 = v11;
  swift_release();
  sub_8C94(v3, v5, v7);
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_332E0();
  uint64_t v37 = v14;
  uint64_t v38 = v13;
  uint64_t v39 = v15;
  char v36 = v16 & 1;
  sub_8C94(v8, v10, v12 & 1);
  swift_bridgeObjectRelease();
  sub_32F30();
  id v17 = (id)qword_4A3D0;
  uint64_t v18 = sub_33300();
  uint64_t v20 = v19;
  char v22 = v21 & 1;
  sub_33240();
  uint64_t v23 = sub_332F0();
  uint64_t v25 = v24;
  char v27 = v26;
  swift_release();
  sub_8C94(v18, v20, v22);
  swift_bridgeObjectRelease();
  sub_33450();
  uint64_t v28 = sub_332B0();
  uint64_t v30 = v29;
  char v32 = v31;
  uint64_t v34 = v33;
  swift_release();
  sub_8C94(v23, v25, v27 & 1);
  swift_bridgeObjectRelease();
  *(void *)a1 = v38;
  *(void *)(a1 + 8) = v37;
  *(unsigned char *)(a1 + 16) = v36;
  *(void *)(a1 + 24) = v39;
  *(void *)(a1 + 32) = v28;
  *(void *)(a1 + 40) = v30;
  *(unsigned char *)(a1 + 48) = v32 & 1;
  *(void *)(a1 + 56) = v34;
  sub_FB70(v38, v37, v36);
  swift_bridgeObjectRetain();
  sub_FB70(v28, v30, v32 & 1);
  swift_bridgeObjectRetain();
  sub_8C94(v28, v30, v32 & 1);
  swift_bridgeObjectRelease();
  sub_8C94(v38, v37, v36);

  return swift_bridgeObjectRelease();
}

__n128 sub_26E30@<Q0>(uint64_t a1@<X8>)
{
  sub_269B4((uint64_t)v20);
  uint64_t v2 = v20[0];
  uint64_t v3 = v20[1];
  char v4 = v21;
  uint64_t v5 = v22;
  uint64_t v6 = v23;
  char v7 = v24;
  uint64_t v8 = v26;
  char v9 = v27;
  long long v18 = v28;
  long long v19 = v25;
  uint64_t v10 = v29;
  id v11 = [self systemGray5Color];
  v20[0] = sub_33460();
  uint64_t v12 = sub_33520();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 40) = v7;
  *(_OWORD *)(a1 + 48) = v19;
  *(void *)(a1 + 64) = v8;
  *(unsigned char *)(a1 + 72) = v9;
  *(_OWORD *)(a1 + 80) = v18;
  *(void *)(a1 + 96) = v10;
  *(void *)(a1 + 104) = v12;
  __asm { FMOV            V0.2D, #14.0 }
  *(__n128 *)(a1 + 112) = result;
  *(__n128 *)(a1 + 128) = result;
  *(unsigned char *)(a1 + 144) = 0;
  return result;
}

unint64_t sub_26F38()
{
  unint64_t result = qword_45280;
  if (!qword_45280)
  {
    type metadata accessor for WallpaperAutobahnViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_45280);
  }
  return result;
}

unint64_t sub_26F94()
{
  unint64_t result = qword_48C88;
  if (!qword_48C88)
  {
    sub_6E48(&qword_48C90);
    sub_27034();
    sub_E818(&qword_48A70, &qword_48A78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48C88);
  }
  return result;
}

unint64_t sub_27034()
{
  unint64_t result = qword_48C98;
  if (!qword_48C98)
  {
    sub_6E48(&qword_48CA0);
    sub_270D4();
    sub_E818(&qword_48CD8, &qword_48CE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48C98);
  }
  return result;
}

unint64_t sub_270D4()
{
  unint64_t result = qword_48CA8;
  if (!qword_48CA8)
  {
    sub_6E48(&qword_48CB0);
    sub_E818(&qword_48CB8, &qword_48CC0);
    sub_E818(&qword_48CC8, &qword_48CD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48CA8);
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceCornerRadius()
{
  return &type metadata for DeviceCornerRadius;
}

uint64_t sub_271A8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_271C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v6 = sub_32D00();
  uint64_t v7 = v6 - 8;
  __chkstk_darwin(v6);
  char v9 = (double *)((char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = sub_5CC8(&qword_48CE8);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = [self mainScreen];
  id v15 = [v14 traitCollection];

  [v15 displayCornerRadius];
  double v17 = v16;

  if (v17 != _UITraitCollectionDisplayCornerRadiusUnspecified) {
    a3 = v17 * 0.333333333;
  }
  long long v18 = (char *)v9 + *(int *)(v7 + 28);
  uint64_t v19 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v20 = sub_32F40();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 104))(v18, v19, v20);
  double *v9 = a3;
  v9[1] = a3;
  uint64_t v21 = (uint64_t)&v13[*(int *)(v11 + 44)];
  sub_273FC((uint64_t)v9, v21);
  *(_WORD *)(v21 + *(int *)(sub_5CC8(&qword_48CF0) + 36)) = 256;
  uint64_t v22 = sub_5CC8(&qword_48CF8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 16))(v13, a1, v22);
  sub_27460((uint64_t)v9);
  return sub_274BC((uint64_t)v13, a2);
}

uint64_t sub_273F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_271C4(a1, a2, *v2);
}

uint64_t sub_273FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_32D00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_27460(uint64_t a1)
{
  uint64_t v2 = sub_32D00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_274BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5CC8(&qword_48CE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_27528()
{
  unint64_t result = qword_48D00;
  if (!qword_48D00)
  {
    sub_6E48(&qword_48CE8);
    sub_E818(&qword_48D08, &qword_48CF8);
    sub_E818(&qword_48D10, &qword_48CF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48D00);
  }
  return result;
}

uint64_t sub_275EC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_32A70();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_27660()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_32A70();
  swift_release();
  swift_release();
  return v1;
}

void *sub_276D4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v26 = a2;
  uint64_t v27 = a3;
  uint64_t v6 = sub_5CC8(&qword_48378);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_5CC8(&qword_488E8);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_5CC8(&qword_48E10);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  double v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v17 = (char *)v4 + OBJC_IVAR____TtC17WallpaperSettings26WallpaperSnapshotViewModel__snapshot;
  uint64_t v29 = 0;
  sub_5CC8((uint64_t *)&unk_48D68);
  sub_32A60();
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v17, v16, v13);
  long long v18 = (char *)v4 + OBJC_IVAR____TtC17WallpaperSettings26WallpaperSnapshotViewModel__isLoading;
  char v28 = 0;
  sub_32A60();
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v18, v12, v9);
  *(void *)((char *)v4 + OBJC_IVAR____TtC17WallpaperSettings26WallpaperSnapshotViewModel_snapshotTask) = 0;
  uint64_t v19 = v26;
  v4[2] = a1;
  v4[3] = v19;
  v4[4] = v27;
  uint64_t v20 = sub_337D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v8, 1, 1, v20);
  sub_337A0();
  id v21 = a1;
  swift_retain();
  uint64_t v22 = sub_33790();
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = v22;
  v23[3] = &protocol witness table for MainActor;
  v23[4] = v4;
  uint64_t v24 = sub_964C((uint64_t)v8, (uint64_t)&unk_45918, (uint64_t)v23);

  *(void *)((char *)v4 + OBJC_IVAR____TtC17WallpaperSettings26WallpaperSnapshotViewModel_snapshotTask) = v24;
  swift_release();
  return v4;
}

uint64_t sub_279D0()
{
  v0[2] = sub_337A0();
  v0[3] = sub_33790();
  unsigned __int8 v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  void *v1 = v0;
  v1[1] = sub_27A7C;
  return sub_27C18();
}

uint64_t sub_27A7C()
{
  swift_task_dealloc();
  uint64_t v1 = sub_33770();
  return _swift_task_switch(sub_27BB8, v1, v0);
}

uint64_t sub_27BB8()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_27C18()
{
  v1[15] = v0;
  uint64_t v2 = sub_329A0();
  v1[16] = v2;
  v1[17] = *(void *)(v2 - 8);
  v1[18] = swift_task_alloc();
  v1[19] = swift_task_alloc();
  uint64_t v3 = sub_32960();
  v1[20] = v3;
  v1[21] = *(void *)(v3 - 8);
  v1[22] = swift_task_alloc();
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  v1[25] = swift_task_alloc();
  sub_5CC8((uint64_t *)&unk_48440);
  v1[26] = swift_task_alloc();
  v1[27] = swift_task_alloc();
  v1[28] = swift_task_alloc();
  uint64_t v4 = sub_328E0();
  v1[29] = v4;
  v1[30] = *(void *)(v4 - 8);
  v1[31] = swift_task_alloc();
  v1[32] = swift_task_alloc();
  v1[33] = swift_task_alloc();
  v1[34] = swift_task_alloc();
  uint64_t v5 = sub_32A10();
  v1[35] = v5;
  v1[36] = *(void *)(v5 - 8);
  v1[37] = swift_task_alloc();
  v1[38] = swift_task_alloc();
  v1[39] = swift_task_alloc();
  sub_337A0();
  v1[40] = sub_33790();
  uint64_t v7 = sub_33770();
  v1[41] = v7;
  v1[42] = v6;
  return _swift_task_switch(sub_27EE8, v7, v6);
}

uint64_t sub_27EE8()
{
  uint64_t v100 = v0;
  uint64_t v1 = (uint64_t *)(v0 + 120);
  uint64_t v2 = (uint64_t *)(v0 + 88);
  id v3 = (id)BSInterfaceOrientationDescription();
  uint64_t v4 = sub_336E0();
  unint64_t v6 = v5;

  *(void *)(v0 + 344) = v4;
  *(void *)(v0 + 352) = v6;
  if (qword_48348 != -1) {
    swift_once();
  }
  uint64_t v7 = *(void *)(v0 + 312);
  uint64_t v8 = *(void *)(v0 + 288);
  uint64_t v9 = sub_6CA4(*(void *)(v0 + 280), (uint64_t)qword_4A400);
  *(void *)(v0 + 360) = v9;
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  *(void *)(v0 + 368) = v10;
  *(void *)(v0 + 376) = (v8 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  id v95 = v10;
  uint64_t v97 = v9;
  ((void (*)(uint64_t))v10)(v7);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_329F0();
  os_log_type_t v12 = sub_33910();
  if (os_log_type_enabled(v11, v12))
  {
    os_log_type_t v88 = v12;
    log = v11;
    uint64_t v13 = *v1;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v99 = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136315650;
    swift_bridgeObjectRetain();
    uint64_t v92 = v4;
    *(void *)(v0 + 112) = sub_1FEFC(v4, v6, &v99);
    sub_33A30();
    unint64_t v93 = v6;
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v14 + 12) = 2082;
    id v15 = [*(id *)(v13 + 16) serverUUID];
    if (v15)
    {
      double v16 = v15;
      uint64_t v17 = *(void *)(v0 + 264);
      uint64_t v19 = *(void *)(v0 + 232);
      uint64_t v18 = *(void *)(v0 + 240);
      uint64_t v20 = *(void *)(v0 + 224);
      sub_328D0();

      id v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32);
      v21(v20, v17, v19);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56))(v20, 0, 1, v19);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v20, 1, v19) != 1)
      {
        uint64_t v85 = *(void *)(v0 + 288);
        uint64_t v22 = *(void *)(v0 + 272);
        uint64_t v86 = *(void *)(v0 + 280);
        uint64_t v87 = *(void *)(v0 + 312);
        uint64_t v23 = *(void *)(v0 + 232);
        uint64_t v24 = *(void *)(v0 + 240);
        uint64_t v25 = *(void *)(v0 + 120);
        v21(v22, *(void *)(v0 + 224), v23);
        sub_2B684();
        uint64_t v26 = sub_33BA0();
        unint64_t v28 = v27;
        (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v23);
        *(void *)(v0 + 80) = sub_1FEFC(v26, v28, &v99);
        uint64_t v2 = (uint64_t *)(v0 + 88);
        sub_33A30();
        swift_bridgeObjectRelease();
        swift_release_n();
        *(_WORD *)(v14 + 22) = 2050;
        uint64_t v29 = *(void *)(v25 + 24);
        swift_release();
        *(void *)(v0 + 40) = v29;
        sub_33A30();
        swift_release();
        _os_log_impl(&dword_0, log, v88, "Start %s %{public}s, %{public}ld", (uint8_t *)v14, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v30 = *(void (**)(uint64_t, uint64_t))(v85 + 8);
        v30(v87, v86);
        unint64_t v6 = v93;
        uint64_t v4 = v92;
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v79 = *(void *)(v0 + 232);
      uint64_t v80 = *(void *)(v0 + 240);
      uint64_t v81 = *(void *)(v0 + 224);
      swift_release_n();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v80 + 56))(v81, 1, 1, v79);
      __break(1u);
    }
    swift_release_n();
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v31 = *(void *)(v0 + 312);
  uint64_t v32 = *(void *)(v0 + 280);
  uint64_t v33 = *(void *)(v0 + 288);
  swift_release_n();
  swift_bridgeObjectRelease_n();

  uint64_t v30 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
  v30(v31, v32);
LABEL_8:
  double v94 = (void (*)(uint64_t, os_log_t))v30;
  *(void *)(v0 + 384) = v30;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_32A70();
  swift_release();
  swift_release();
  if (*(unsigned char *)(v0 + 457))
  {
    uint64_t v34 = *(void *)(v0 + 304);
    uint64_t v35 = *(void *)(v0 + 280);
    swift_release();
    v95(v34, v97, v35);
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    char v36 = sub_329F0();
    os_log_type_t v37 = sub_33910();
    if (!os_log_type_enabled(v36, v37))
    {
      uint64_t v68 = *(void *)(v0 + 304);
      uint64_t v69 = *(NSObject **)(v0 + 280);
      swift_release_n();
      swift_bridgeObjectRelease_n();

      uint64_t v57 = v68;
      os_log_t v56 = v69;
      goto LABEL_18;
    }
    os_log_type_t v96 = v37;
    unint64_t v98 = v36;
    uint64_t v38 = *v1;
    uint64_t v39 = v4;
    uint64_t v40 = swift_slowAlloc();
    uint64_t v99 = swift_slowAlloc();
    *(_DWORD *)uint64_t v40 = 136315650;
    swift_bridgeObjectRetain();
    uint64_t *v2 = sub_1FEFC(v39, v6, &v99);
    sub_33A30();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v40 + 12) = 2082;
    id v41 = [*(id *)(v38 + 16) serverUUID];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)(v0 + 264);
      uint64_t v44 = *(void *)(v0 + 232);
      uint64_t v45 = *(void *)(v0 + 240);
      uint64_t v46 = *(void *)(v0 + 216);
      sub_328D0();

      uint64_t v47 = *(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 32);
      v47(v46, v43, v44);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v45 + 56))(v46, 0, 1, v44);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48))(v46, 1, v44) != 1)
      {
        os_log_t loga = *(os_log_t *)(v0 + 280);
        uint64_t v91 = *(void *)(v0 + 304);
        uint64_t v48 = *(void *)(v0 + 256);
        uint64_t v50 = *(void *)(v0 + 232);
        uint64_t v49 = *(void *)(v0 + 240);
        uint64_t v51 = *(void *)(v0 + 120);
        v47(v48, *(void *)(v0 + 216), v50);
        sub_2B684();
        uint64_t v52 = sub_33BA0();
        unint64_t v54 = v53;
        (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v48, v50);
        *(void *)(v0 + 96) = sub_1FEFC(v52, v54, &v99);
        sub_33A30();
        swift_bridgeObjectRelease();
        swift_release_n();
        *(_WORD *)(v40 + 22) = 2050;
        uint64_t v55 = *(void *)(v51 + 24);
        swift_release();
        *(void *)(v0 + 104) = v55;
        sub_33A30();
        swift_release();
        _os_log_impl(&dword_0, v98, v96, "Already loading %s %{public}s, %{public}ld", (uint8_t *)v40, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        os_log_t v56 = loga;
        uint64_t v57 = v91;
LABEL_18:
        v94(v57, v56);
        sub_2992C(*(void *)(v0 + 344), *(void *)(v0 + 352), *(void *)(v0 + 120));
        swift_bridgeObjectRelease();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v70 = *(uint64_t (**)(void))(v0 + 8);
        return v70();
      }
LABEL_30:
      uint64_t result = swift_release_n();
      __break(1u);
      return result;
    }
LABEL_29:
    uint64_t v82 = *(void *)(v0 + 232);
    uint64_t v83 = *(void *)(v0 + 240);
    uint64_t v84 = *(void *)(v0 + 216);
    swift_release_n();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v83 + 56))(v84, 1, 1, v82);
    __break(1u);
    goto LABEL_30;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 456) = 1;
  swift_retain();
  sub_32A80();
  if (qword_48358 != -1) {
    swift_once();
  }
  uint64_t v58 = sub_32990();
  *(void *)(v0 + 392) = sub_6CA4(v58, (uint64_t)qword_4A430);
  sub_32970();
  sub_32940();
  uint64_t v59 = sub_32970();
  os_signpost_type_t v60 = sub_33990();
  if (sub_33A20())
  {
    uint64_t v61 = *(void *)(v0 + 192);
    uint64_t v62 = *(void *)(v0 + 160);
    uint64_t v63 = *(void *)(v0 + 168);
    BOOL v64 = *(void (**)(uint64_t, uint64_t, uint64_t))(v63 + 16);
    unint64_t v65 = (v63 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v64(v61, *(void *)(v0 + 200), v62);
    BOOL v66 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v66 = 0;
    os_signpost_id_t v67 = sub_32950();
    _os_signpost_emit_with_name_impl(&dword_0, v59, v60, v67, "LoadWallpaperSnapshot", "", v66, 2u);
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v61, v62);
  }
  else
  {
    uint64_t v72 = *(void *)(v0 + 168);

    BOOL v64 = *(void (**)(uint64_t, uint64_t, uint64_t))(v72 + 16);
    unint64_t v65 = (v72 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  }
  uint64_t v74 = *(void *)(v0 + 192);
  uint64_t v73 = *(void *)(v0 + 200);
  uint64_t v75 = *(void *)(v0 + 160);
  *(void *)(v0 + 400) = v64;
  *(void *)(v0 + 408) = v65;
  v64(v74, v73, v75);
  sub_329D0();
  swift_allocObject();
  *(void *)(v0 + 416) = sub_329C0();
  if (qword_48338 != -1) {
    swift_once();
  }
  uint64_t v76 = (void *)qword_4A3D8;
  *(void *)(v0 + 424) = qword_4A3D8;
  id v77 = v76;
  uint64_t v78 = (void *)swift_task_alloc();
  *(void *)(v0 + 432) = v78;
  void *v78 = v0;
  v78[1] = sub_28AAC;
  return sub_29E6C((uint64_t)v77);
}

uint64_t sub_28AAC(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 440) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = *(void *)(v4 + 328);
    uint64_t v6 = *(void *)(v4 + 336);
    uint64_t v7 = sub_28F20;
  }
  else
  {

    *(void *)(v4 + 448) = a1;
    uint64_t v5 = *(void *)(v4 + 328);
    uint64_t v6 = *(void *)(v4 + 336);
    uint64_t v7 = sub_28BDC;
  }
  return _swift_task_switch(v7, v5, v6);
}

uint64_t sub_28BDC()
{
  uint64_t v1 = (uint64_t *)(v0 + 184);
  uint64_t v2 = *(void **)(v0 + 448);
  uint64_t v3 = *(void *)(v0 + 120);
  swift_release();
  uint64_t v4 = swift_task_alloc();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = v2;
  sub_335F0();
  sub_32C00();
  swift_release();

  swift_task_dealloc();
  uint64_t v5 = sub_32970();
  sub_329B0();
  os_signpost_type_t v6 = sub_33980();
  if (sub_33A20())
  {
    uint64_t v7 = *(void *)(v0 + 152);
    uint64_t v8 = *(void *)(v0 + 128);
    uint64_t v9 = *(void *)(v0 + 136);
    swift_retain();
    sub_329E0();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v9 + 88))(v7, v8) == enum case for OSSignpostError.doubleEnd(_:))
    {
      uint64_t v10 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 136) + 8))(*(void *)(v0 + 152), *(void *)(v0 + 128));
      uint64_t v10 = "";
    }
    uint64_t v1 = (uint64_t *)(v0 + 192);
    uint64_t v13 = *(void *)(v0 + 184);
    uint64_t v14 = *(void *)(v0 + 160);
    uint64_t v15 = *(void *)(v0 + 168);
    (*(void (**)(void, uint64_t, uint64_t))(v0 + 400))(*(void *)(v0 + 192), v13, v14);
    double v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v16 = 0;
    os_signpost_id_t v17 = sub_32950();
    _os_signpost_emit_with_name_impl(&dword_0, v5, v6, v17, "LoadWallpaperSnapshot", v10, v16, 2u);
    swift_slowDealloc();

    os_log_type_t v12 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v12(v13, v14);
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 168);

    os_log_type_t v12 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  }
  uint64_t v18 = *(void *)(v0 + 200);
  uint64_t v19 = *(void *)(v0 + 160);
  v12(*v1, v19);
  swift_release();
  v12(v18, v19);
  sub_2992C(*(void *)(v0 + 344), *(void *)(v0 + 352), *(void *)(v0 + 120));
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
  return v20();
}

uint64_t sub_28F20()
{
  uint64_t v57 = v0;
  uint64_t v1 = *(void **)(v0 + 424);
  swift_release();

  uint64_t v2 = sub_32970();
  sub_329B0();
  os_signpost_type_t v3 = sub_33980();
  if (sub_33A20())
  {
    uint64_t v4 = *(void *)(v0 + 136);
    uint64_t v5 = *(void *)(v0 + 144);
    uint64_t v6 = *(void *)(v0 + 128);
    swift_retain();
    sub_329E0();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v4 + 88))(v5, v6) == enum case for OSSignpostError.doubleEnd(_:))
    {
      uint64_t v7 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 136) + 8))(*(void *)(v0 + 144), *(void *)(v0 + 128));
      uint64_t v7 = "";
    }
    uint64_t v12 = *(void *)(v0 + 192);
    uint64_t v13 = *(void *)(v0 + 168);
    uint64_t v14 = *(void *)(v0 + 176);
    uint64_t v15 = *(void *)(v0 + 160);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 400))(v12, v14, v15);
    double v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v16 = 0;
    os_signpost_id_t v17 = sub_32950();
    _os_signpost_emit_with_name_impl(&dword_0, v2, v3, v17, "LoadWallpaperSnapshot", v7, v16, 2u);
    swift_slowDealloc();

    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v11(v14, v15);
    v11(v12, v15);
  }
  else
  {
    uint64_t v9 = *(void *)(v0 + 168);
    uint64_t v8 = *(void *)(v0 + 176);
    uint64_t v10 = *(void *)(v0 + 160);

    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v11(v8, v10);
  }
  uint64_t v18 = *(void *)(v0 + 360);
  unint64_t v54 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 368);
  uint64_t v19 = *(void *)(v0 + 296);
  uint64_t v20 = *(void *)(v0 + 280);
  uint64_t v21 = *(void *)(v0 + 200);
  uint64_t v22 = *(void *)(v0 + 160);
  swift_release();
  v11(v21, v22);
  v54(v19, v18, v20);
  swift_retain_n();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v23 = sub_329F0();
  os_log_type_t v24 = sub_338F0();
  if (!os_log_type_enabled(v23, v24))
  {
    uint64_t v42 = *(void (**)(uint64_t, uint64_t))(v0 + 384);
    uint64_t v43 = *(void *)(v0 + 296);
    uint64_t v44 = *(void *)(v0 + 280);
    swift_release_n();
    swift_errorRelease();
    swift_errorRelease();

    v42(v43, v44);
    goto LABEL_12;
  }
  os_log_type_t v55 = v24;
  uint64_t v25 = *(void *)(v0 + 120);
  uint64_t v26 = swift_slowAlloc();
  v56[0] = swift_slowAlloc();
  *(_DWORD *)uint64_t v26 = 134349570;
  *(void *)(v0 + 48) = *(void *)(v25 + 24);
  sub_33A30();
  *(_WORD *)(v26 + 12) = 2082;
  id v27 = [*(id *)(v25 + 16) serverUUID];
  if (!v27)
  {
    uint64_t v47 = *(void *)(v0 + 232);
    uint64_t v48 = *(void *)(v0 + 240);
    uint64_t v49 = *(void *)(v0 + 208);
    swift_errorRelease();
    swift_release();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v48 + 56))(v49, 1, 1, v47);
    __break(1u);
    goto LABEL_16;
  }
  unint64_t v28 = v27;
  log = v23;
  uint64_t v29 = *(void *)(v0 + 264);
  uint64_t v31 = *(void *)(v0 + 232);
  uint64_t v30 = *(void *)(v0 + 240);
  uint64_t v32 = *(void *)(v0 + 208);
  sub_328D0();

  uint64_t v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 32);
  v33(v32, v29, v31);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v30 + 56))(v32, 0, 1, v31);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v32, 1, v31) == 1)
  {
LABEL_16:
    swift_errorRelease();
    uint64_t result = swift_release();
    __break(1u);
    return result;
  }
  uint64_t v51 = *(void *)(v0 + 296);
  uint64_t v52 = *(void (**)(uint64_t, uint64_t))(v0 + 384);
  uint64_t v50 = *(void *)(v0 + 280);
  uint64_t v35 = *(void *)(v0 + 240);
  uint64_t v34 = *(void *)(v0 + 248);
  uint64_t v36 = *(void *)(v0 + 232);
  v33(v34, *(void *)(v0 + 208), v36);
  sub_2B684();
  uint64_t v37 = sub_33BA0();
  unint64_t v39 = v38;
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v36);
  *(void *)(v0 + 56) = sub_1FEFC(v37, v39, v56);
  sub_33A30();
  swift_bridgeObjectRelease();
  swift_release_n();
  *(_WORD *)(v26 + 22) = 2080;
  swift_getErrorValue();
  uint64_t v40 = sub_33BE0();
  *(void *)(v0 + 72) = sub_1FEFC(v40, v41, v56);
  sub_33A30();
  swift_bridgeObjectRelease();
  swift_errorRelease();
  swift_errorRelease();
  _os_log_impl(&dword_0, log, v55, "Failed to get %{public}ld snapshot for %{public}s: %s", (uint8_t *)v26, 0x20u);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  v52(v51, v50);
LABEL_12:
  sub_335F0();
  sub_32C00();
  swift_errorRelease();
  swift_release();
  sub_2992C(*(void *)(v0 + 344), *(void *)(v0 + 352), *(void *)(v0 + 120));
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v45 = *(uint64_t (**)(void))(v0 + 8);
  return v45();
}

uint64_t sub_29644()
{
  if (*(id *)((char *)v0 + OBJC_IVAR____TtC17WallpaperSettings26WallpaperSnapshotViewModel_snapshotTask))
  {
    swift_retain();
    sub_33830();
    swift_release();
  }

  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC17WallpaperSettings26WallpaperSnapshotViewModel__snapshot;
  uint64_t v2 = sub_5CC8(&qword_48E10);
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  os_signpost_type_t v3 = (char *)v0 + OBJC_IVAR____TtC17WallpaperSettings26WallpaperSnapshotViewModel__isLoading;
  uint64_t v4 = sub_5CC8(&qword_488E8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  uint64_t v5 = *((unsigned int *)*v0 + 12);
  uint64_t v6 = *((unsigned __int16 *)*v0 + 26);

  return _swift_deallocClassInstance(v0, v5, v6);
}

uint64_t sub_29788()
{
  return type metadata accessor for WallpaperSnapshotViewModel();
}

uint64_t type metadata accessor for WallpaperSnapshotViewModel()
{
  uint64_t result = qword_48D50;
  if (!qword_48D50) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_297DC()
{
  sub_298D0();
  if (v0 <= 0x3F)
  {
    sub_19964();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_298D0()
{
  if (!qword_48D60)
  {
    sub_6E48((uint64_t *)&unk_48D68);
    unint64_t v0 = sub_32A90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_48D60);
    }
  }
}

uint64_t sub_2992C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v42 = a1;
  uint64_t v5 = sub_5CC8((uint64_t *)&unk_48440);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_328E0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  unint64_t v41 = (char *)&v35 - v13;
  uint64_t v14 = sub_32A10();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  os_signpost_id_t v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_48348 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_6CA4(v14, (uint64_t)qword_4A400);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v18, v14);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v19 = sub_329F0();
  int v40 = sub_33910();
  if (os_log_type_enabled(v19, (os_log_type_t)v40))
  {
    uint64_t v37 = v15;
    os_log_t v38 = v19;
    uint64_t v39 = v14;
    uint64_t v20 = a3;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    uint64_t v44 = v36;
    *(_DWORD *)uint64_t v21 = 136315650;
    swift_bridgeObjectRetain();
    uint64_t v43 = sub_1FEFC(v42, a2, &v44);
    sub_33A30();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v21 + 12) = 2082;
    uint64_t v42 = v20;
    id v22 = [*(id *)(v20 + 16) serverUUID];
    if (v22)
    {
      uint64_t v23 = v22;
      sub_328D0();

      os_log_type_t v24 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
      v24(v7, v11, v8);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      int v25 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
      uint64_t v26 = v39;
      if (v25 != 1)
      {
        id v27 = v41;
        v24(v41, v7, v8);
        sub_2B684();
        uint64_t v28 = sub_33BA0();
        unint64_t v30 = v29;
        (*(void (**)(char *, uint64_t))(v9 + 8))(v27, v8);
        uint64_t v43 = sub_1FEFC(v28, v30, &v44);
        sub_33A30();
        uint64_t v31 = v42;
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v21 + 22) = 2050;
        uint64_t v32 = *(void *)(v31 + 24);
        swift_release();
        uint64_t v43 = v32;
        sub_33A30();
        swift_release();
        os_log_t v33 = v38;
        _os_log_impl(&dword_0, v38, (os_log_type_t)v40, "Complete %s %{public}s, %{public}ld", (uint8_t *)v21, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v17, v26);
      }
    }
    else
    {
      swift_release_n();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
      __break(1u);
    }
    uint64_t result = swift_release_n();
    __break(1u);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  return result;
}

uint64_t sub_29E6C(uint64_t a1)
{
  v2[193] = v1;
  v2[187] = a1;
  sub_337A0();
  v2[199] = sub_33790();
  uint64_t v4 = sub_33770();
  v2[205] = v4;
  v2[211] = v3;
  return _swift_task_switch(sub_29F0C, v4, v3);
}

uint64_t sub_29F0C()
{
  uint64_t v1 = v0[193];
  uint64_t v2 = (void *)v0[187];
  uint64_t v3 = swift_allocObject();
  v0[217] = v3;
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = v2;
  swift_retain();
  id v4 = v2;
  swift_retain();
  sub_70C4(255, &qword_454B8);
  swift_asyncLet_begin();
  uint64_t v5 = swift_allocObject();
  v0[218] = v5;
  *(void *)(v5 + 16) = v1;
  *(void *)(v5 + 24) = v4;
  swift_retain();
  id v6 = v4;
  swift_retain();
  swift_asyncLet_begin();
  return _swift_asyncLet_get_throwing(v0 + 2, v0 + 181, sub_2A08C, v0 + 176);
}

uint64_t sub_2A08C()
{
  v1[219] = v0;
  if (v0)
  {
    return _swift_asyncLet_finish(v1 + 82, v1 + 175, sub_2A488, v1 + 182);
  }
  else
  {
    uint64_t v2 = (void *)v1[181];
    v1[220] = v2;
    id v3 = v2;
    return _swift_asyncLet_get_throwing(v1 + 82, v1 + 175, sub_2A158, v1 + 194);
  }
}

uint64_t sub_2A158()
{
  v1[221] = v0;
  if (v0) {
    uint64_t v2 = sub_2A5C8;
  }
  else {
    uint64_t v2 = sub_2A190;
  }
  return _swift_task_switch(v2, v1[205], v1[211]);
}

uint64_t sub_2A190()
{
  uint64_t v1 = (void *)v0[220];
  uint64_t v2 = (void *)v0[175];
  id v3 = self;
  id v4 = v2;
  id v5 = v1;
  id v6 = v4;
  id v7 = [v3 currentTraitCollection];
  uint64_t v8 = (void *)sub_33970();
  uint64_t v9 = (void *)sub_33970();
  sub_5CC8(&qword_45950);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_34B60;
  *(void *)(inited + 32) = v8;
  *(void *)(inited + 40) = v5;
  *(void *)(inited + 48) = v9;
  *(void *)(inited + 56) = v6;
  id v11 = v5;
  id v12 = v6;
  id v13 = v8;
  id v14 = v9;
  unint64_t v15 = sub_9A44(inited);
  id v16 = v11;
  sub_2BAD8(v15, v11);
  v0[222] = v17;

  swift_bridgeObjectRelease();
  return _swift_asyncLet_finish(v0 + 82, v0 + 175, sub_2A34C, v0 + 188);
}

uint64_t sub_2A34C()
{
  return _swift_task_switch(sub_2A368, *(void *)(v0 + 1640), *(void *)(v0 + 1688));
}

uint64_t sub_2A368()
{
  swift_release();
  return _swift_asyncLet_finish(v0 + 16, v0 + 1448, sub_2A3E8, v0 + 1296);
}

uint64_t sub_2A3E8()
{
  return _swift_task_switch(sub_2A404, *(void *)(v0 + 1640), *(void *)(v0 + 1688));
}

uint64_t sub_2A404()
{
  swift_release();
  swift_release_n();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 1776);
  return v1(v2);
}

uint64_t sub_2A488()
{
  return _swift_task_switch(sub_2A4A4, *(void *)(v0 + 1640), *(void *)(v0 + 1688));
}

uint64_t sub_2A4A4()
{
  swift_release();
  return _swift_asyncLet_finish(v0 + 16, v0 + 1448, sub_2A524, v0 + 1696);
}

uint64_t sub_2A524()
{
  return _swift_task_switch(sub_2A540, *(void *)(v0 + 1640), *(void *)(v0 + 1688));
}

uint64_t sub_2A540()
{
  swift_release();
  swift_release_n();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2A5C8()
{
  return _swift_asyncLet_finish(v0 + 656, v0 + 1400, sub_2A648, v0 + 1600);
}

uint64_t sub_2A648()
{
  return _swift_task_switch(sub_2A664, *(void *)(v0 + 1640), *(void *)(v0 + 1688));
}

uint64_t sub_2A664()
{
  swift_release();
  return _swift_asyncLet_finish(v0 + 16, v0 + 1448, sub_2A6E4, v0 + 1648);
}

uint64_t sub_2A6E4()
{
  return _swift_task_switch(sub_2A700, *(void *)(v0 + 1640), *(void *)(v0 + 1688));
}

uint64_t sub_2A700()
{
  swift_release();
  swift_release_n();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2A788(uint64_t a1, void *a2)
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_32A80();
  id v3 = a2;
  sub_33470();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_32A80();
}

uint64_t sub_2A850()
{
  return sub_32A80();
}

uint64_t sub_2A8C0()
{
  return 1;
}

Swift::Int sub_2A8C8()
{
  return sub_33C50();
}

void sub_2A90C()
{
}

Swift::Int sub_2A934()
{
  return sub_33C50();
}

uint64_t sub_2A994(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  id v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v5;
  void *v5 = v3;
  v5[1] = sub_2AA38;
  return sub_2AB84(0, a3);
}

uint64_t sub_2AA38(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    id v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 32) = a1;
    return _swift_task_switch(sub_2BA78, 0, 0);
  }
}

uint64_t sub_2AB84(char a1, uint64_t a2)
{
  *(void *)(v3 + 128) = a2;
  *(void *)(v3 + 136) = v2;
  *(unsigned char *)(v3 + 184) = a1;
  sub_337A0();
  *(void *)(v3 + 144) = sub_33790();
  uint64_t v5 = sub_33770();
  *(void *)(v3 + 152) = v5;
  *(void *)(v3 + 160) = v4;
  return _swift_task_switch(sub_2AC20, v5, v4);
}

uint64_t sub_2AC20()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 16;
  uint64_t v3 = v0 + 80;
  uint64_t v5 = *(void **)(v1 + 128);
  uint64_t v4 = *(void **)(v1 + 136);
  uint64_t v6 = 128;
  if (v4[3] == 1) {
    uint64_t v6 = 132;
  }
  uint64_t v7 = 32;
  if (*(unsigned char *)(v1 + 184)) {
    uint64_t v7 = 16;
  }
  id v8 = [objc_allocWithZone((Class)PRSPosterSnapshotRequest) initWithConfiguration:v4[2] variantType:v4[3] == 1 options:v6 | v7 orientation:v4[4]];
  *(void *)(v1 + 168) = v8;
  *(void *)(v1 + 16) = v1;
  *(void *)(v1 + 56) = v1 + 120;
  *(void *)(v1 + 24) = sub_2AD98;
  uint64_t v9 = swift_continuation_init();
  *(void *)(v1 + 80) = _NSConcreteStackBlock;
  *(void *)(v1 + 88) = 0x40000000;
  *(void *)(v1 + 96) = sub_1EC08;
  *(void *)(v1 + 104) = &unk_434B8;
  *(void *)(v1 + 112) = v9;
  [v5 fetchPosterSnapshotsWithRequest:v8 completion:v3];
  return _swift_continuation_await(v2);
}

uint64_t sub_2AD98()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 176) = v2;
  uint64_t v3 = *(void *)(v1 + 160);
  uint64_t v4 = *(void *)(v1 + 152);
  if (v2) {
    uint64_t v5 = sub_2B0F0;
  }
  else {
    uint64_t v5 = sub_2AEC8;
  }
  return _swift_task_switch(v5, v4, v3);
}

void sub_2AEC8()
{
  swift_release();
  uint64_t v1 = (void *)v0[15];
  id v2 = [v1 snapshots];
  sub_70C4(0, (unint64_t *)&qword_48E20);
  unint64_t v3 = sub_33760();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_33B70();
    swift_bridgeObjectRelease();
    if (v11)
    {
LABEL_3:
      if ((v3 & 0xC000000000000001) != 0)
      {
        id v4 = (id)sub_33AB0();
      }
      else
      {
        if (!*(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFFF8)))
        {
          __break(1u);
          goto LABEL_16;
        }
        id v4 = *(id *)(v3 + 32);
      }
      uint64_t v5 = v4;
      swift_bridgeObjectRelease();
      id v6 = [v5 imageOrientation];
      id v7 = [v5 image];
      id v8 = [objc_allocWithZone((Class)UIImage) initWithCGImage:v7 imageOrientation:v6];

      if (v8)
      {
        uint64_t v9 = (void *)v0[21];

        uint64_t v10 = (void (*)(id))v0[1];
        v10(v8);
        return;
      }
LABEL_16:
      __break(1u);
      return;
    }
  }
  else if (*(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFFF8)))
  {
    goto LABEL_3;
  }
  id v12 = (void *)v0[21];
  swift_bridgeObjectRelease();
  sub_2B8A0();
  swift_allocError();
  swift_willThrow();

  id v13 = (void (*)(void))v0[1];
  v13();
}

uint64_t sub_2B0F0()
{
  uint64_t v1 = *(void **)(v0 + 168);
  swift_release();
  swift_willThrow();

  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2B168(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v5;
  void *v5 = v3;
  v5[1] = sub_2B20C;
  return sub_2AB84(1, a3);
}

uint64_t sub_2B20C(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    id v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 32) = a1;
    return _swift_task_switch(sub_2B358, 0, 0);
  }
}

uint64_t sub_2B358()
{
  **(void **)(v0 + 16) = *(void *)(v0 + 32);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2B37C()
{
  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2B3BC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_66C8;
  return sub_279D0();
}

uint64_t sub_2B470@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_32A70();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2B4F0()
{
  return sub_32A80();
}

uint64_t sub_2B564@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_32A70();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2B5E4()
{
  return sub_32A80();
}

uint64_t sub_2B668()
{
  return sub_2A850();
}

unint64_t sub_2B684()
{
  unint64_t result = qword_48E18;
  if (!qword_48E18)
  {
    sub_328E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48E18);
  }
  return result;
}

uint64_t sub_2B6DC()
{
  return sub_2A788(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_2B704(uint64_t a1)
{
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  id v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *id v6 = v2;
  v6[1] = sub_719C;
  return sub_2A994(a1, v5, v4);
}

uint64_t sub_2B7B4()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2B7F4(uint64_t a1)
{
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  id v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *id v6 = v2;
  v6[1] = sub_66C8;
  return sub_2B168(a1, v5, v4);
}

unint64_t sub_2B8A0()
{
  unint64_t result = qword_45960;
  if (!qword_45960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_45960);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for WallpaperSnapshotViewModel.SnapshotError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for WallpaperSnapshotViewModel.SnapshotError(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x2B9E4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for WallpaperSnapshotViewModel.SnapshotError()
{
  return &type metadata for WallpaperSnapshotViewModel.SnapshotError;
}

unint64_t sub_2BA24()
{
  unint64_t result = qword_45968;
  if (!qword_45968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_45968);
  }
  return result;
}

uint64_t sub_2BA7C(uint64_t a1)
{
  return sub_2BA8C(a1);
}

uint64_t sub_2BA84(uint64_t a1)
{
  return sub_2BA8C(a1);
}

uint64_t sub_2BA8C(uint64_t a1)
{
  return sub_32A20();
}

void sub_2BAD8(unint64_t a1, void *a2)
{
  unsigned int v4 = a2;
  if (a2)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
LABEL_3:
      unint64_t v29 = 0;
      uint64_t v5 = 0;
      unint64_t v6 = 0;
      unint64_t v7 = sub_33AE0() | 0x8000000000000000;
      goto LABEL_10;
    }
LABEL_6:
    uint64_t v11 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v5 = ~v11;
    unint64_t v29 = a1 + 64;
    uint64_t v12 = -v11;
    if (v12 < 64) {
      uint64_t v13 = ~(-1 << v12);
    }
    else {
      uint64_t v13 = -1;
    }
    unint64_t v6 = v13 & *(void *)(a1 + 64);
    unint64_t v7 = a1;
LABEL_10:
    id v14 = a2;
    swift_bridgeObjectRetain();
    uint64_t v15 = 0;
    int64_t v28 = (unint64_t)(v5 + 64) >> 6;
    if ((v7 & 0x8000000000000000) != 0) {
      goto LABEL_13;
    }
    while (1)
    {
      if (v6)
      {
        uint64_t v16 = (v6 - 1) & v6;
        unint64_t v17 = __clz(__rbit64(v6)) | (v15 << 6);
        uint64_t v18 = v15;
      }
      else
      {
        int64_t v21 = v15 + 1;
        if (__OFADD__(v15, 1))
        {
          __break(1u);
          return;
        }
        if (v21 >= v28) {
          goto LABEL_33;
        }
        unint64_t v22 = *(void *)(v29 + 8 * v21);
        uint64_t v18 = v15 + 1;
        if (!v22)
        {
          uint64_t v18 = v15 + 2;
          if (v15 + 2 >= v28) {
            goto LABEL_33;
          }
          unint64_t v22 = *(void *)(v29 + 8 * v18);
          if (!v22)
          {
            uint64_t v18 = v15 + 3;
            if (v15 + 3 >= v28) {
              goto LABEL_33;
            }
            unint64_t v22 = *(void *)(v29 + 8 * v18);
            if (!v22)
            {
              uint64_t v18 = v15 + 4;
              if (v15 + 4 >= v28) {
                goto LABEL_33;
              }
              unint64_t v22 = *(void *)(v29 + 8 * v18);
              if (!v22)
              {
                uint64_t v23 = v15 + 5;
                while (v28 != v23)
                {
                  unint64_t v22 = *(void *)(v29 + 8 * v23++);
                  if (v22)
                  {
                    uint64_t v18 = v23 - 1;
                    goto LABEL_29;
                  }
                }
LABEL_33:
                sub_2BE48();
                return;
              }
            }
          }
        }
LABEL_29:
        uint64_t v16 = (v22 - 1) & v22;
        unint64_t v17 = __clz(__rbit64(v22)) + (v18 << 6);
      }
      uint64_t v24 = 8 * v17;
      int v25 = *(void **)(*(void *)(v7 + 56) + v24);
      id v19 = *(id *)(*(void *)(v7 + 48) + v24);
      id v20 = v25;
      if (!v19) {
        goto LABEL_33;
      }
      while (1)
      {
        id v26 = [v4 imageAsset];
        [v26 registerImage:v20 withTraitCollection:v19];

        uint64_t v15 = v18;
        unint64_t v6 = v16;
        if ((v7 & 0x8000000000000000) == 0) {
          break;
        }
LABEL_13:
        if (sub_33B30())
        {
          sub_70C4(0, &qword_452A0);
          swift_unknownObjectRetain();
          swift_dynamicCast();
          id v19 = v30;
          swift_unknownObjectRelease();
          sub_70C4(0, &qword_454B8);
          swift_unknownObjectRetain();
          swift_dynamicCast();
          id v20 = v30;
          swift_unknownObjectRelease();
          uint64_t v18 = v15;
          uint64_t v16 = v6;
          if (v30) {
            continue;
          }
        }
        goto LABEL_33;
      }
    }
  }
  uint64_t v8 = swift_bridgeObjectRetain();
  uint64_t v9 = (void *)sub_AC60(v8);
  unsigned int v4 = v10;
  swift_bridgeObjectRelease();
  if (v9)
  {

    if ((a1 & 0xC000000000000001) != 0) {
      goto LABEL_3;
    }
    goto LABEL_6;
  }
  id v27 = objc_allocWithZone((Class)UIImage);

  [v27 init];
}

uint64_t sub_2BE48()
{
  return swift_release();
}

uint64_t sub_2BE50(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_2BEA0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_32A70();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2BF14(uint64_t a1)
{
  v2[20] = a1;
  v2[21] = v1;
  sub_337A0();
  v2[22] = sub_33790();
  uint64_t v4 = sub_33770();
  v2[23] = v4;
  v2[24] = v3;
  return _swift_task_switch(sub_2BFAC, v4, v3);
}

uint64_t sub_2BFAC()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = OBJC_IVAR____TtC17WallpaperSettings29NewWallpaperItemWellViewModel_isLoading;
  v0[25] = OBJC_IVAR____TtC17WallpaperSettings29NewWallpaperItemWellViewModel_isLoading;
  if (*(unsigned char *)(v1 + v2))
  {
    swift_release();
    uint64_t v3 = (uint64_t (*)(void))v0[1];
    return v3();
  }
  else
  {
    uint64_t v5 = v0[20];
    *(unsigned char *)(v1 + v2) = 1;
    if (v5 == 1) {
      uint64_t v6 = 132;
    }
    else {
      uint64_t v6 = 128;
    }
    id v7 = [objc_allocWithZone((Class)PRSPosterSnapshotRequest) initWithConfigurationType:-1 variantType:v5 == 1 options:v6];
    v0[26] = v7;
    if (qword_48338 != -1) {
      swift_once();
    }
    uint64_t v8 = (void *)qword_4A3D8;
    v0[2] = v0;
    v0[7] = v0 + 19;
    v0[3] = sub_2C18C;
    uint64_t v9 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_1EC08;
    v0[13] = &unk_43560;
    v0[14] = v9;
    [v8 fetchPosterSnapshotsWithRequest:v7 completion:v0 + 10];
    return _swift_continuation_await(v0 + 2);
  }
}

uint64_t sub_2C18C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 216) = v2;
  uint64_t v3 = *(void *)(v1 + 192);
  uint64_t v4 = *(void *)(v1 + 184);
  if (v2) {
    uint64_t v5 = sub_2C4B4;
  }
  else {
    uint64_t v5 = sub_2C2BC;
  }
  return _swift_task_switch(v5, v4, v3);
}

void sub_2C2BC()
{
  swift_release();
  uint64_t v1 = (void *)v0[19];
  id v2 = [v1 snapshots];
  sub_2C9E8();
  unint64_t v3 = sub_33760();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_33B70();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v12 = v0[25];
    uint64_t v11 = (void *)v0[26];
    uint64_t v13 = v0[21];
    swift_bridgeObjectRelease();

    uint64_t v9 = (unsigned char *)(v13 + v12);
    goto LABEL_9;
  }
  if (!*(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFFF8))) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_33AB0();
  }
  else
  {
    if (!*(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFFF8)))
    {
      __break(1u);
      return;
    }
    id v4 = *(id *)(v3 + 32);
  }
  uint64_t v5 = v4;
  uint64_t v6 = (void *)v0[26];
  swift_bridgeObjectRelease();
  id v7 = [v5 surface];
  id v8 = [objc_allocWithZone((Class)UIImage) initWithIOSurface:v7];

  swift_getKeyPath();
  swift_getKeyPath();
  v0[10] = v8;
  swift_retain();
  sub_32A80();

  uint64_t v9 = (unsigned char *)(v0[21] + v0[25]);
LABEL_9:
  unsigned char *v9 = 0;
  id v14 = (void (*)(void))v0[1];
  v14();
}

uint64_t sub_2C4B4()
{
  uint64_t v11 = v0;
  swift_release();
  swift_willThrow();
  if (qword_48348 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_32A10();
  sub_6CA4(v1, (uint64_t)qword_4A400);
  swift_errorRetain();
  swift_errorRetain();
  id v2 = sub_329F0();
  os_log_type_t v3 = sub_338F0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v9 = *(void **)(v0 + 208);
    id v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)id v4 = 136315138;
    swift_getErrorValue();
    uint64_t v5 = sub_33BE0();
    *(void *)(v0 + 80) = sub_1FEFC(v5, v6, &v10);
    sub_33A30();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v3, "Failed to get silhouette for home screen: %s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  *(unsigned char *)(*(void *)(v0 + 168) + *(void *)(v0 + 200)) = 0;
  id v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_2C704@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_32A70();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2C784(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  swift_retain();
  return sub_32A80();
}

uint64_t sub_2C7FC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17WallpaperSettings29NewWallpaperItemWellViewModel__snapshot;
  uint64_t v2 = sub_5CC8(&qword_48EF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_2C8A0()
{
  return type metadata accessor for NewWallpaperItemWellViewModel();
}

uint64_t type metadata accessor for NewWallpaperItemWellViewModel()
{
  uint64_t result = qword_48E58;
  if (!qword_48E58) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2C8F4()
{
  sub_2C98C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_2C98C()
{
  if (!qword_48E68)
  {
    sub_6E48(&qword_483D0);
    unint64_t v0 = sub_32A90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_48E68);
    }
  }
}

unint64_t sub_2C9E8()
{
  unint64_t result = qword_48E20;
  if (!qword_48E20)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_48E20);
  }
  return result;
}

uint64_t sub_2CA30()
{
  uint64_t v0 = sub_33930();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_33920();
  __chkstk_darwin(v4);
  uint64_t v5 = sub_33660();
  __chkstk_darwin(v5 - 8);
  sub_2D1B4();
  sub_33650();
  v7[1] = &_swiftEmptyArrayStorage;
  sub_2D1F4();
  sub_5CC8(&qword_48F10);
  sub_2D24C();
  sub_33A50();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  uint64_t result = sub_33960();
  qword_48EF8 = result;
  return result;
}

void sub_2CC30(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_5CC8(&qword_48F00);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  *(void *)(swift_allocObject() + 16) = a2;
  id v7 = a2;
  sub_337E0();
  id v8 = [objc_allocWithZone((Class)PRSWallpaperLocationStateObserver) init];
  [v8 setLocations:15];
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v9 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v10 + v9, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_2D094;
  aBlock[5] = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2D118;
  aBlock[3] = &unk_435C8;
  uint64_t v11 = _Block_copy(aBlock);
  swift_release();
  [v8 setHandler:v11];
  _Block_release(v11);
  id v12 = [objc_allocWithZone((Class)PRSWallpaperObserverConfiguration) init];
  [v12 setLocationStateObserver:v8];
  if (qword_48360 != -1) {
    swift_once();
  }
  [v12 setQueue:qword_48EF8];
  [v7 activateWithConfiguration:v12];
}

uint64_t sub_2CEE0()
{
  return swift_deallocObject();
}

id sub_2CF18()
{
  return [*(id *)(v0 + 16) invalidate];
}

uint64_t sub_2CF28()
{
  uint64_t v0 = sub_5CC8(&qword_48F20);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5CC8(&qword_48F00);
  sub_337F0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_2D000()
{
  uint64_t v1 = sub_5CC8(&qword_48F00);
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80)), v1);

  return swift_deallocObject();
}

uint64_t sub_2D094()
{
  sub_5CC8(&qword_48F00);

  return sub_2CF28();
}

void sub_2D118(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(id, id))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(v7, v6);
  swift_release();
}

uint64_t sub_2D19C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2D1AC()
{
  return swift_release();
}

unint64_t sub_2D1B4()
{
  unint64_t result = qword_48388;
  if (!qword_48388)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_48388);
  }
  return result;
}

unint64_t sub_2D1F4()
{
  unint64_t result = qword_48F08;
  if (!qword_48F08)
  {
    sub_33920();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48F08);
  }
  return result;
}

unint64_t sub_2D24C()
{
  unint64_t result = qword_48F18;
  if (!qword_48F18)
  {
    sub_6E48(&qword_48F10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48F18);
  }
  return result;
}

uint64_t destroy for WallpaperAutobahnView(uint64_t a1)
{
  swift_release();
  if (*(void *)(a1 + 16)) {
    swift_release();
  }
  if (*(void *)(a1 + 32)) {
    swift_release();
  }

  return swift_release();
}

void *initializeWithCopy for WallpaperAutobahnView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  id v6 = a2 + 2;
  uint64_t v5 = a2[2];
  swift_retain();
  if (v5)
  {
    uint64_t v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *v6;
  }
  uint64_t v8 = a2[4];
  if (v8)
  {
    uint64_t v9 = a2[5];
    a1[4] = v8;
    a1[5] = v9;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  }
  a1[6] = a2[6];
  swift_retain();
  return a1;
}

void *assignWithCopy for WallpaperAutobahnView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v4 = a2[2];
  if (a1[2])
  {
    if (v4)
    {
      uint64_t v5 = a2[3];
      a1[2] = v4;
      a1[3] = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[3];
    a1[2] = v4;
    a1[3] = v6;
    swift_retain();
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  uint64_t v7 = a2[4];
  if (!a1[4])
  {
    if (v7)
    {
      uint64_t v9 = a2[5];
      a1[4] = v7;
      a1[5] = v9;
      swift_retain();
      goto LABEL_15;
    }
LABEL_14:
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
    goto LABEL_15;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v8 = a2[5];
  a1[4] = v7;
  a1[5] = v8;
  swift_retain();
  swift_release();
LABEL_15:
  a1[6] = a2[6];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for WallpaperAutobahnView(uint64_t a1, uint64_t a2)
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

void *assignWithTake for WallpaperAutobahnView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_release();
  uint64_t v5 = a2[2];
  if (a1[2])
  {
    if (v5)
    {
      uint64_t v6 = a2[3];
      a1[2] = v5;
      a1[3] = v6;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    uint64_t v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  uint64_t v8 = a2[4];
  if (!a1[4])
  {
    if (v8)
    {
      uint64_t v10 = a2[5];
      a1[4] = v8;
      a1[5] = v10;
      goto LABEL_15;
    }
LABEL_14:
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
    goto LABEL_15;
  }
  if (!v8)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v9 = a2[5];
  a1[4] = v8;
  a1[5] = v9;
  swift_release();
LABEL_15:
  a1[6] = a2[6];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for WallpaperAutobahnView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WallpaperAutobahnView(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WallpaperAutobahnView()
{
  return &type metadata for WallpaperAutobahnView;
}

uint64_t sub_2D65C()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_2D678@<D0>(_OWORD *a1@<X8>)
{
  sub_21FD0();
  sub_32EF0();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_2D6C8()
{
  return sub_32F00();
}

uint64_t sub_2D714@<X0>(void *a1@<X8>)
{
  sub_21F7C();
  uint64_t result = sub_32EF0();
  *a1 = v3;
  return result;
}

uint64_t sub_2D764()
{
  return sub_32F00();
}

uint64_t sub_2D7B0@<X0>(uint64_t a1@<X8>)
{
  v25[1] = a1;
  uint64_t v2 = sub_32F10();
  uint64_t v26 = *(void *)(v2 - 8);
  uint64_t v27 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_5CC8(&qword_45978);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_5CC8(&qword_45980);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25[0] = sub_5CC8(&qword_45988);
  __chkstk_darwin(v25[0]);
  id v14 = (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = v1;
  sub_5CC8(&qword_45990);
  sub_E818(&qword_45998, &qword_45990);
  sub_332A0();
  uint64_t v15 = sub_E818(&qword_459A0, &qword_45978);
  sub_33320();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v29 = v5;
  uint64_t v30 = v15;
  swift_getOpaqueTypeConformance2();
  sub_33380();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_32F30();
  if (qword_48330 != -1) {
    swift_once();
  }
  id v16 = (id)qword_4A3D0;
  uint64_t v17 = sub_33300();
  uint64_t v19 = v18;
  char v21 = v20 & 1;
  uint64_t v23 = v26;
  uint64_t v22 = v27;
  (*(void (**)(char *, void, uint64_t))(v26 + 104))(v4, enum case for NavigationBarItem.TitleDisplayMode.inline(_:), v27);
  sub_2E1E4();
  sub_333E0();
  sub_8C94(v17, v19, v21);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v4, v22);
  return sub_2E2F0((uint64_t)v14);
}

uint64_t sub_2DC14@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v30 = sub_5CC8(&qword_48F28);
  uint64_t v28 = *(void *)(v30 - 8);
  uint64_t v3 = v28;
  __chkstk_darwin(v30);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v26 - v7;
  uint64_t v9 = sub_5CC8(&qword_459B0);
  uint64_t v29 = *(void *)(v9 - 8);
  uint64_t v10 = v29;
  __chkstk_darwin(v9);
  id v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v26 - v14;
  uint64_t v33 = a1;
  sub_5CC8(&qword_459B8);
  sub_2E358();
  sub_33590();
  uint64_t v32 = a1;
  type metadata accessor for PosterGestureTutorialView();
  sub_2E7D4(&qword_48F38, (void (*)(uint64_t))type metadata accessor for PosterGestureTutorialView);
  uint64_t v27 = v8;
  sub_33590();
  id v16 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v16(v12, v15, v9);
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  uint64_t v18 = v8;
  uint64_t v19 = v30;
  v17(v5, v18, v30);
  char v20 = v31;
  v16(v31, v12, v9);
  uint64_t v21 = sub_5CC8(&qword_459F8);
  uint64_t v22 = v5;
  v17(&v20[*(int *)(v21 + 48)], v5, v19);
  uint64_t v23 = *(void (**)(char *, uint64_t))(v28 + 8);
  v23(v27, v19);
  uint64_t v24 = *(void (**)(char *, uint64_t))(v29 + 8);
  v24(v15, v9);
  v23(v22, v19);
  return ((uint64_t (*)(char *, uint64_t))v24)(v12, v9);
}

uint64_t sub_2DF44@<X0>(long long *a1@<X0>, uint64_t *a2@<X8>)
{
  type metadata accessor for PosterConfigurationCarouselViewModel();
  sub_2E7D4((unint64_t *)&qword_483B8, (void (*)(uint64_t))type metadata accessor for PosterConfigurationCarouselViewModel);
  swift_retain();
  uint64_t v4 = sub_32C30();
  uint64_t v6 = v5;
  long long v11 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_32A70();
  swift_release();
  swift_release();
  sub_2E824((uint64_t)&v11);
  uint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_32A70();
  swift_release();
  swift_release();
  sub_2E824((uint64_t)&v11);
  uint64_t result = swift_getKeyPath();
  *a2 = v4;
  a2[1] = v6;
  a2[2] = KeyPath;
  a2[3] = v9;
  a2[4] = v10;
  a2[5] = result;
  a2[6] = v9;
  return result;
}

uint64_t sub_2E0D4@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  sub_5CC8(&qword_48C10);
  swift_storeEnumTagMultiPayload();
  uint64_t v2 = (uint64_t *)((char *)a1 + *(int *)(type metadata accessor for PosterGestureTutorialView() + 20));
  type metadata accessor for WallpaperAutobahnViewModel();
  sub_2E7D4((unint64_t *)&qword_45280, (void (*)(uint64_t))type metadata accessor for WallpaperAutobahnViewModel);
  swift_retain();
  uint64_t result = sub_32C30();
  uint64_t *v2 = result;
  v2[1] = v4;
  return result;
}

uint64_t sub_2E198@<X0>(uint64_t a1@<X8>)
{
  return sub_2D7B0(a1);
}

uint64_t sub_2E1DC@<X0>(char *a1@<X8>)
{
  return sub_2DC14(*(void *)(v1 + 16), a1);
}

unint64_t sub_2E1E4()
{
  unint64_t result = qword_459A8;
  if (!qword_459A8)
  {
    sub_6E48(&qword_45988);
    sub_6E48(&qword_45978);
    sub_E818(&qword_459A0, &qword_45978);
    swift_getOpaqueTypeConformance2();
    sub_2E7D4(&qword_452F8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_459A8);
  }
  return result;
}

uint64_t sub_2E2F0(uint64_t a1)
{
  uint64_t v2 = sub_5CC8(&qword_45988);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2E350@<X0>(uint64_t *a1@<X8>)
{
  return sub_2DF44(*(long long **)(v1 + 16), a1);
}

unint64_t sub_2E358()
{
  unint64_t result = qword_459C0;
  if (!qword_459C0)
  {
    sub_6E48(&qword_459B8);
    sub_2E3F8();
    sub_E818(&qword_459E8, &qword_459F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_459C0);
  }
  return result;
}

unint64_t sub_2E3F8()
{
  unint64_t result = qword_459C8;
  if (!qword_459C8)
  {
    sub_6E48(&qword_459D0);
    sub_2E498();
    sub_E818(&qword_459D8, &qword_459E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_459C8);
  }
  return result;
}

unint64_t sub_2E498()
{
  unint64_t result = qword_48F30;
  if (!qword_48F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48F30);
  }
  return result;
}

uint64_t sub_2E4EC@<X0>(uint64_t *a1@<X8>)
{
  return sub_2E0D4(a1);
}

double sub_2E4F4@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_32A70();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_2E574()
{
  return sub_32A80();
}

uint64_t sub_2E5F0@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_32A70();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2E670()
{
  return sub_32A80();
}

uint64_t sub_2E6E4()
{
  return sub_32DE0();
}

uint64_t sub_2E708(uint64_t a1)
{
  uint64_t v2 = sub_32C40();
  __n128 v3 = __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t, __n128))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  return sub_32DF0();
}

uint64_t sub_2E7D4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2E824(uint64_t a1)
{
  return a1;
}

double sub_2E850@<D0>(_OWORD *a1@<X8>)
{
  sub_21FD0();
  sub_32EF0();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_2E8A0()
{
  return sub_32F00();
}

uint64_t sub_2E8F4@<X0>(void *a1@<X8>)
{
  sub_21F7C();
  uint64_t result = sub_32EF0();
  *a1 = v3;
  return result;
}

uint64_t sub_2E944()
{
  return sub_32F00();
}

uint64_t sub_2E990()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_2E9EC()
{
  uint64_t v1 = OBJC_IVAR____TtC17WallpaperSettings41PosterGestureTutorialAnimationPackageView_packageLayer;
  [*(id *)&v0[OBJC_IVAR____TtC17WallpaperSettings41PosterGestureTutorialAnimationPackageView_packageLayer] removeFromSuperlayer];
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC17WallpaperSettings41PosterGestureTutorialAnimationPackageView_package];
  if (v2)
  {
    id v10 = v2;
    id v3 = [v10 rootLayer];
    if (v3)
    {
      uint64_t v4 = v3;
      objc_msgSend(v3, "setGeometryFlipped:", objc_msgSend(v10, "isGeometryFlipped"));
      [v4 setContentsGravity:kCAGravityResizeAspect];
      objc_msgSend(v4, "setAnchorPoint:", 0.5, 0.0);
      [v4 setMasksToBounds:1];
      [v4 setFillMode:kCAFillModeBackwards];
      uint64_t v5 = *(void **)&v0[v1];
      *(void *)&v0[v1] = v4;
      id v6 = v4;

      id v7 = [v0 layer];
      [v7 setShouldRasterize:1];

      id v8 = [v0 layer];
      [v8 addSublayer:v6];

      [v0 invalidateIntrinsicContentSize];
      uint64_t v9 = v6;
    }
    else
    {
      uint64_t v9 = v10;
    }
  }
}

id sub_2EBA4(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR____TtC17WallpaperSettings41PosterGestureTutorialAnimationPackageView_package] = 0;
  v4[OBJC_IVAR____TtC17WallpaperSettings41PosterGestureTutorialAnimationPackageView_animating] = 0;
  *(void *)&v4[OBJC_IVAR____TtC17WallpaperSettings41PosterGestureTutorialAnimationPackageView_packageLayer] = 0;
  v16.receiver = v4;
  v16.super_class = (Class)type metadata accessor for PosterGestureTutorialAnimationPackageView();
  id v9 = objc_msgSendSuper2(&v16, "initWithFrame:", a1, a2, a3, a4);
  [v9 setUserInteractionEnabled:0];
  id v10 = self;
  id v11 = v9;
  id v12 = [v10 clearColor];
  [v11 setBackgroundColor:v12];

  sub_2EED0();
  sub_5CC8(&qword_45A18);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_36970;
  *(void *)(v13 + 32) = sub_32A30();
  *(void *)(v13 + 40) = &protocol witness table for UITraitUserInterfaceStyle;
  id v14 = v11;
  sub_339D0();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return v14;
}

void sub_2ED2C(unsigned char *a1)
{
  int v2 = a1[OBJC_IVAR____TtC17WallpaperSettings41PosterGestureTutorialAnimationPackageView_animating];
  a1[OBJC_IVAR____TtC17WallpaperSettings41PosterGestureTutorialAnimationPackageView_animating] = 0;
  id v3 = [a1 layer];
  [v3 convertTime:0 fromLayer:CACurrentMediaTime()];
  double v5 = v4;

  id v6 = [a1 layer];
  [v6 setSpeed:0.0];

  id v7 = [a1 layer];
  [v7 setTimeOffset:v5];

  sub_2EED0();
  [a1 setNeedsDisplay];
  if (v2 == 1) {
    sub_2F500();
  }
}

uint64_t sub_2EED0()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  uint64_t v2 = sub_5CC8(&qword_48368);
  __chkstk_darwin(v2 - 8);
  double v4 = &v21[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_328B0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = &v21[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(void *)&double v10 = __chkstk_darwin(v9).n128_u64[0];
  id v12 = &v21[-v11];
  id v13 = objc_msgSend(v0, "traitCollection", v10);
  id v14 = [v13 userInterfaceStyle];

  sub_2F140((uint64_t)v14, (uint64_t)v4);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    return sub_2F8BC((uint64_t)v4);
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 32))(v12, v4, v5);
  sub_2F91C();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 16))(v8, v12, v5);
  uint64_t v16 = sub_336E0();
  id v18 = sub_2F338((uint64_t)v8, v16, v17, 0);
  uint64_t v19 = *(void **)&v0[OBJC_IVAR____TtC17WallpaperSettings41PosterGestureTutorialAnimationPackageView_package];
  *(void *)&v1[OBJC_IVAR____TtC17WallpaperSettings41PosterGestureTutorialAnimationPackageView_package] = v18;
  id v20 = v18;

  sub_2E9EC();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v12, v5);
}

uint64_t sub_2F140@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v3 = 0xD000000000000023;
  if (a1 != 2) {
    unint64_t v3 = 0xD000000000000024;
  }
  unint64_t v4 = 0x8000000000037BF0;
  if (a1 != 2) {
    unint64_t v4 = 0x8000000000037BC0;
  }
  id v5 = objc_msgSend(self, "currentDevice", v3, v4);
  uint64_t v6 = (char *)[v5 userInterfaceIdiom];

  if (v6 == (unsigned char *)&dword_0 + 1)
  {
    v19._countAndFlagsBits = 0x646150692DLL;
    v19._object = (void *)0xE500000000000000;
    sub_33710(v19);
  }
  if (qword_48330 != -1) {
    swift_once();
  }
  id v7 = (id)qword_4A3D0;
  NSString v8 = sub_336D0();
  swift_bridgeObjectRelease();
  NSString v9 = sub_336D0();
  id v10 = [v7 URLForResource:v8 withExtension:v9];

  if (v10)
  {
    sub_32890();

    uint64_t v11 = sub_328B0();
    id v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a2;
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v16 = sub_328B0();
    id v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
    uint64_t v13 = v16;
    uint64_t v14 = a2;
    uint64_t v15 = 1;
  }

  return v12(v14, v15, 1, v13);
}

id sub_2F338(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_32880(__stack_chk_guard);
  id v7 = v6;
  NSString v8 = sub_336D0();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v9.super.Class isa = sub_33670().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  id v18 = 0;
  id v10 = [(id)swift_getObjCClassFromMetadata() packageWithContentsOfURL:v7 type:v8 options:v9.super.isa error:&v18];

  id v11 = v18;
  if (v10)
  {
    uint64_t v12 = sub_328B0();
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8);
    id v14 = v11;
    v13(a1, v12);
  }
  else
  {
    id v15 = v18;
    sub_32870();

    swift_willThrow();
    uint64_t v16 = sub_328B0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a1, v16);
  }
  return v10;
}

void sub_2F500()
{
  v0[OBJC_IVAR____TtC17WallpaperSettings41PosterGestureTutorialAnimationPackageView_animating] = 1;
  id v1 = [v0 layer];
  [v1 timeOffset];
  double v3 = v2;

  id v4 = [v0 layer];
  LODWORD(v5) = 1.0;
  [v4 setSpeed:v5];

  id v6 = [v0 layer];
  [v6 setTimeOffset:0.0];

  id v7 = [v0 layer];
  [v7 setBeginTime:0.0];

  id v8 = [v0 layer];
  [v8 convertTime:0 fromLayer:CACurrentMediaTime()];
  double v10 = v9;

  id v11 = [v0 layer];
  [v11 setBeginTime:v10 - v3];
}

id sub_2F818()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PosterGestureTutorialAnimationPackageView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PosterGestureTutorialAnimationPackageView()
{
  return self;
}

uint64_t sub_2F8BC(uint64_t a1)
{
  uint64_t v2 = sub_5CC8(&qword_48368);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2F91C()
{
  unint64_t result = qword_48F68;
  if (!qword_48F68)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_48F68);
  }
  return result;
}

uint64_t destroy for WallpaperSnapshotView(uint64_t a1)
{
  swift_release();
  sub_787C(*(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));

  return swift_release();
}

uint64_t initializeWithCopy for WallpaperSnapshotView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  swift_retain();
  sub_7870(v5, v6, v7);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v8;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for WallpaperSnapshotView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  char v6 = *(unsigned char *)(a2 + 32);
  sub_7870(v4, v5, v6);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  char v9 = *(unsigned char *)(a1 + 32);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  sub_787C(v7, v8, v9);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for WallpaperSnapshotView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 24);
  char v5 = *(unsigned char *)(a2 + 32);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  char v8 = *(unsigned char *)(a1 + 32);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  sub_787C(v6, v7, v8);
  uint64_t v9 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v9;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for WallpaperSnapshotView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WallpaperSnapshotView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WallpaperSnapshotView()
{
  return &type metadata for WallpaperSnapshotView;
}

uint64_t sub_2FBC8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2FBE4(uint64_t a1)
{
  if (a1 == 1)
  {
    if (qword_48330 == -1) {
      goto LABEL_5;
    }
    goto LABEL_6;
  }
  if (qword_48330 != -1) {
LABEL_6:
  }
    swift_once();
LABEL_5:
  id v1 = (id)qword_4A3D0;
  NSString v2 = sub_336D0();
  id v3 = [v1 localizedStringForKey:v2 value:0 table:0];

  uint64_t v4 = sub_336E0();
  return v4;
}

uint64_t sub_2FD0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v74 = a1;
  uint64_t v3 = sub_5CC8((uint64_t *)&unk_48440);
  __chkstk_darwin(v3 - 8);
  uint64_t v90 = (char *)&v71 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_328E0();
  uint64_t v91 = *(void *)(v5 - 8);
  uint64_t v92 = v5;
  __chkstk_darwin(v5);
  uint64_t v75 = (char *)&v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v73 = (char *)&v71 - v8;
  uint64_t v87 = sub_33120();
  uint64_t v86 = *(void *)(v87 - 8);
  __chkstk_darwin(v87);
  uint64_t v85 = (char *)&v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_33180();
  uint64_t v81 = *(void *)(v83 - 8);
  __chkstk_darwin(v83);
  uint64_t v79 = (char *)&v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_5CC8(&qword_45A20);
  uint64_t v12 = v11 - 8;
  __chkstk_darwin(v11);
  id v14 = (char *)&v71 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_5CC8(&qword_45A28);
  __chkstk_darwin(v76);
  uint64_t v16 = (char *)&v71 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_5CC8(&qword_45A30);
  __chkstk_darwin(v17);
  Swift::String v19 = (char *)&v71 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_5CC8(&qword_45A38);
  uint64_t v78 = *(void *)(v80 - 8);
  __chkstk_darwin(v80);
  id v77 = (char *)&v71 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = sub_5CC8(&qword_45A40);
  __chkstk_darwin(v89);
  uint64_t v82 = (char *)&v71 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v84 = (char *)&v71 - v23;
  __chkstk_darwin(v24);
  os_log_type_t v88 = (char *)&v71 - v25;
  __chkstk_darwin(v26);
  uint64_t v72 = (char *)&v71 - v27;
  long long v28 = *(_OWORD *)(v2 + 16);
  long long v101 = *(_OWORD *)v2;
  char v100 = *(unsigned char *)(v2 + 32);
  long long v98 = *(_OWORD *)(v2 + 40);
  long long v99 = v28;
  uint64_t v29 = *((void *)&v98 + 1);
  uint64_t v30 = swift_allocObject();
  long long v31 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v30 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v30 + 32) = v31;
  *(_OWORD *)(v30 + 48) = *(_OWORD *)(v2 + 32);
  *(void *)(v30 + 64) = *(void *)(v2 + 48);
  uint64_t v93 = v2;
  sub_315B4((uint64_t)&v101);
  sub_315E0((uint64_t)&v99);
  sub_31614((uint64_t)&v98);
  sub_5CC8(&qword_45A48);
  sub_31640();
  sub_334C0();
  uint64_t v32 = sub_335C0();
  uint64_t v34 = v33;
  uint64_t v35 = (uint64_t)&v14[*(int *)(v12 + 44)];
  sub_30F04((long long *)v2, v35);
  uint64_t v36 = (uint64_t *)(v35 + *(int *)(sub_5CC8(&qword_48F80) + 36));
  *uint64_t v36 = v32;
  v36[1] = v34;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  uint64_t v37 = v29;
  sub_32A70();
  swift_release();
  swift_release();
  sub_2E824((uint64_t)&v98);
  char v38 = 1;
  if ((v96 & 1) == 0) {
    char v38 = sub_31764(v29) ^ 1;
  }
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v40 = swift_allocObject();
  *(unsigned char *)(v40 + 16) = v38 & 1;
  sub_FB0C((uint64_t)v14, (uint64_t)v16, &qword_45A20);
  unint64_t v41 = (uint64_t *)&v16[*(int *)(v76 + 36)];
  *unint64_t v41 = KeyPath;
  v41[1] = (uint64_t)sub_318D4;
  v41[2] = v40;
  sub_6D44((uint64_t)v14, &qword_45A20);
  sub_FB0C((uint64_t)v16, (uint64_t)v19, &qword_45A28);
  v19[*(int *)(v17 + 36)] = 1;
  sub_6D44((uint64_t)v16, &qword_45A28);
  uint64_t v42 = v79;
  sub_33170();
  unint64_t v43 = sub_318EC();
  uint64_t v44 = v77;
  sub_333F0();
  (*(void (**)(char *, uint64_t))(v81 + 8))(v42, v83);
  sub_6D44((uint64_t)v19, &qword_45A30);
  uint64_t v45 = v37;
  uint64_t v96 = sub_2FBE4(*(void *)(v37 + 24));
  uint64_t v97 = v46;
  uint64_t v94 = v17;
  unint64_t v95 = v43;
  swift_getOpaqueTypeConformance2();
  sub_31B48();
  uint64_t v47 = (uint64_t)v82;
  uint64_t v48 = v80;
  sub_333D0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v78 + 8))(v44, v48);
  uint64_t v49 = swift_allocObject();
  long long v50 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v49 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v49 + 32) = v50;
  *(_OWORD *)(v49 + 48) = *(_OWORD *)(v2 + 32);
  *(void *)(v49 + 64) = *(void *)(v2 + 48);
  sub_315B4((uint64_t)&v101);
  sub_315E0((uint64_t)&v99);
  sub_31614((uint64_t)&v98);
  uint64_t v51 = v85;
  sub_33110();
  uint64_t v52 = (uint64_t)v84;
  sub_32CA0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v86 + 8))(v51, v87);
  sub_6D44(v47, &qword_45A40);
  if (qword_48330 != -1) {
    swift_once();
  }
  id v53 = (id)qword_4A3D0;
  NSString v54 = sub_336D0();
  id v55 = [v53 localizedStringForKey:v54 value:0 table:0];

  uint64_t v56 = sub_336E0();
  uint64_t v58 = v57;

  uint64_t v96 = v56;
  uint64_t v97 = v58;
  uint64_t v59 = (uint64_t)v88;
  sub_32C80();
  swift_bridgeObjectRelease();
  sub_6D44(v52, &qword_45A40);
  id v60 = *(id *)(v45 + 16);
  id v61 = [v60 serverUUID];
  uint64_t v63 = v90;
  uint64_t v62 = v91;
  if (v61)
  {
    BOOL v64 = v75;
    sub_328D0();

    unint64_t v65 = *(void (**)(char *, char *, uint64_t))(v62 + 32);
    BOOL v66 = v64;
    uint64_t v67 = v92;
    v65(v63, v66, v92);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v62 + 56))(v63, 0, 1, v67);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v62 + 48))(v63, 1, v67);
    if (result != 1)
    {
      uint64_t v69 = v73;
      v65(v73, v63, v67);

      sub_328C0();
      (*(void (**)(char *, uint64_t))(v62 + 8))(v69, v67);
      uint64_t v70 = (uint64_t)v72;
      sub_32C70();
      swift_bridgeObjectRelease();
      sub_6D44(v59, &qword_45A40);
      return sub_15198(v70, v74, &qword_45A40);
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v91 + 56))(v90, 1, 1, v92);
  }
  __break(1u);
  return result;
}

uint64_t sub_307E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_5CC8(&qword_48F78);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (uint64_t *)((char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_5CC8(&qword_45A60);
  uint64_t v8 = v7 - 8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *uint64_t v6 = sub_335D0();
  v6[1] = v11;
  uint64_t v12 = sub_5CC8(&qword_48FD0);
  sub_30990(a1, (uint64_t *)((char *)v6 + *(int *)(v12 + 44)));
  sub_FB0C((uint64_t)v6, (uint64_t)v10, &qword_48F78);
  *(void *)&v10[*(int *)(v8 + 44)] = 0;
  sub_6D44((uint64_t)v6, &qword_48F78);
  uint64_t v13 = *(void *)(a1 + 16);
  uint64_t v14 = *(void *)(a1 + 24);
  LOBYTE(a1) = *(unsigned char *)(a1 + 32);
  sub_7870(v13, v14, a1);
  double v15 = sub_13CD0(v13, v14, a1);
  double v17 = v16;
  sub_787C(v13, v14, a1);
  sub_FB0C((uint64_t)v10, a2, &qword_45A60);
  uint64_t v18 = a2 + *(int *)(sub_5CC8(&qword_45A48) + 36);
  *(double *)uint64_t v18 = v15 / v17;
  *(_WORD *)(v18 + 8) = 0;
  return sub_6D44((uint64_t)v10, &qword_45A60);
}

uint64_t sub_30990@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v39 = a2;
  uint64_t v3 = sub_33490();
  uint64_t v35 = *(void *)(v3 - 8);
  uint64_t v36 = v3;
  __chkstk_darwin(v3);
  uint64_t v34 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_33140();
  uint64_t v32 = *(void *)(v5 - 8);
  uint64_t v33 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_5CC8(&qword_48FD8);
  uint64_t v31 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_5CC8(&qword_48FE0);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_5CC8(&qword_48FE8);
  __chkstk_darwin(v15 - 8);
  uint64_t v37 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  Swift::String v19 = (char *)&v31 - v18;
  uint64_t v38 = sub_33430();
  long long v41 = *(_OWORD *)(a1 + 40);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_32A70();
  swift_release();
  swift_release();
  sub_2E824((uint64_t)&v41);
  if (v40 == 1)
  {
    sub_32B20();
    sub_33130();
    sub_E818(&qword_48FF8, &qword_48FD8);
    sub_31DB8(&qword_49000, (void (*)(uint64_t))&type metadata accessor for CircularProgressViewStyle);
    uint64_t v20 = v33;
    sub_33350();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v7, v20);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v10, v8);
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v19, v14, v11);
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v21 = 1;
  }
  uint64_t v23 = v38;
  uint64_t v22 = v39;
  uint64_t v24 = (uint64_t)v37;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v19, v21, 1, v11);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_32A70();
  swift_release();
  swift_release();
  sub_2E824((uint64_t)&v41);
  if (v40)
  {
    uint64_t v26 = v34;
    uint64_t v25 = v35;
    uint64_t v27 = v36;
    (*(void (**)(char *, void, uint64_t))(v35 + 104))(v34, enum case for Image.ResizingMode.stretch(_:), v36);
    uint64_t v28 = sub_334B0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  }
  else
  {
    uint64_t v28 = 0;
  }
  sub_FB0C((uint64_t)v19, v24, &qword_48FE8);
  uint64_t *v22 = v23;
  uint64_t v29 = sub_5CC8(&qword_48FF0);
  sub_FB0C(v24, (uint64_t)v22 + *(int *)(v29 + 48), &qword_48FE8);
  *(uint64_t *)((char *)v22 + *(int *)(v29 + 64)) = v28;
  swift_retain();
  swift_retain();
  sub_6D44((uint64_t)v19, &qword_48FE8);
  swift_release();
  sub_6D44(v24, &qword_48FE8);
  return swift_release();
}

uint64_t sub_30F04@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_5CC8((uint64_t *)&unk_48440);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_328E0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v34 - v12;
  uint64_t v14 = sub_5CC8(&qword_48FB0);
  uint64_t v38 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v37 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v34 - v17;
  long long v47 = *(long long *)((char *)a1 + 40);
  uint64_t v19 = *((void *)&v47 + 1);
  if (sub_31764(*((uint64_t *)&v47 + 1)))
  {
    uint64_t v35 = v14;
    uint64_t v36 = a2;
    long long v20 = a1[1];
    long long v46 = *a1;
    long long v44 = v20;
    char v45 = *((unsigned char *)a1 + 32);
    uint64_t v21 = swift_allocObject();
    long long v22 = a1[1];
    *(_OWORD *)(v21 + 16) = *a1;
    *(_OWORD *)(v21 + 32) = v22;
    *(_OWORD *)(v21 + 48) = a1[2];
    *(void *)(v21 + 64) = *((void *)a1 + 6);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_31614((uint64_t)&v47);
    sub_315B4((uint64_t)&v46);
    sub_315E0((uint64_t)&v44);
    sub_32A70();
    swift_release();
    swift_release();
    sub_2E824((uint64_t)&v47);
    char v23 = (char)v39;
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v25 = swift_allocObject();
    *(unsigned char *)(v25 + 16) = v23;
    uint64_t v39 = sub_31C4C;
    uint64_t v40 = v21;
    uint64_t v41 = KeyPath;
    uint64_t v42 = sub_31E04;
    uint64_t v43 = v25;
    id v26 = *(id *)(v19 + 16);
    id v27 = [v26 serverUUID];
    if (v27)
    {
      uint64_t v28 = v27;
      sub_328D0();

      uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
      v29(v6, v10, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
      if (result != 1)
      {
        v29(v13, v6, v7);

        sub_328C0();
        (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
        sub_5CC8(&qword_48FB8);
        sub_3198C(&qword_48FC0, &qword_48FB8, (void (*)(void))sub_31C78);
        uint64_t v31 = (uint64_t)v37;
        sub_33380();
        swift_bridgeObjectRelease();
        sub_E7CC((uint64_t)v39);
        swift_release();
        swift_release();
        sub_15198(v31, (uint64_t)v18, &qword_48FB0);
        uint64_t v32 = v36;
        sub_15198((uint64_t)v18, v36, &qword_48FB0);
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v38 + 56))(v32, 0, 1, v35);
      }
    }
    else
    {
      uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    }
    __break(1u);
  }
  else
  {
    uint64_t v33 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v38 + 56);
    return v33(a2, 1, 1, v14);
  }
  return result;
}

void *sub_31414(void *result)
{
  if (*result)
  {
    uint64_t v1 = *(void (**)(uint64_t))(*result
                                        + OBJC_IVAR____TtC17WallpaperSettings36PosterConfigurationCarouselViewModel_customizeWallpaperAction);
    if (v1)
    {
      uint64_t v2 = *(void *)(result[6] + 24);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_E7BC((uint64_t)v1);
      sub_32A70();
      swift_release();
      swift_release();

      swift_bridgeObjectRelease();
      if (v4)
      {
        v1(v2);
      }
      sub_E7CC((uint64_t)v1);
      return (void *)swift_release();
    }
  }
  else
  {
    type metadata accessor for PosterConfigurationCarouselViewModel();
    sub_31DB8((unint64_t *)&qword_483B8, (void (*)(uint64_t))type metadata accessor for PosterConfigurationCarouselViewModel);
    uint64_t result = (void *)sub_32D80();
    __break(1u);
  }
  return result;
}

uint64_t sub_31564@<X0>(uint64_t a1@<X8>)
{
  return sub_2FD0C(a1);
}

uint64_t sub_315AC@<X0>(uint64_t a1@<X8>)
{
  return sub_307E8(*(void *)(v1 + 16), a1);
}

uint64_t sub_315B4(uint64_t a1)
{
  return a1;
}

uint64_t sub_315E0(uint64_t a1)
{
  return a1;
}

uint64_t sub_31614(uint64_t a1)
{
  return a1;
}

unint64_t sub_31640()
{
  unint64_t result = qword_45A50;
  if (!qword_45A50)
  {
    sub_6E48(&qword_45A48);
    sub_316BC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_45A50);
  }
  return result;
}

unint64_t sub_316BC()
{
  unint64_t result = qword_45A58;
  if (!qword_45A58)
  {
    sub_6E48(&qword_45A60);
    sub_E818(&qword_48F70, &qword_48F78);
    sub_8C40();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_45A58);
  }
  return result;
}

uint64_t sub_31764(uint64_t a1)
{
  uint64_t v11 = &type metadata for SpringBoardFeatureFlags;
  unint64_t v12 = sub_31BA8();
  v10[0] = 0;
  char v2 = sub_32920();
  sub_20F40((uint64_t)v10);
  if ((v2 & 1) == 0) {
    return 1;
  }
  if (*(void *)(a1 + 24) != 1) {
    return 1;
  }
  id v3 = [*(id *)(a1 + 16) providerBundleIdentifier];
  if (!v3) {
    return 1;
  }
  uint64_t v4 = v3;
  uint64_t v5 = sub_336E0();
  uint64_t v7 = v6;

  if (v5 == 0xD000000000000021 && v7 == 0x8000000000037040)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  char v9 = sub_33BB0();
  swift_bridgeObjectRelease();
  uint64_t result = 0;
  if ((v9 & 1) == 0) {
    return 1;
  }
  return result;
}

uint64_t sub_3186C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_32E90();
  *a1 = result & 1;
  return result;
}

uint64_t sub_3189C()
{
  return sub_32EA0();
}

uint64_t sub_318C4()
{
  return swift_deallocObject();
}

unsigned char *sub_318D4(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

unint64_t sub_318EC()
{
  unint64_t result = qword_45A68;
  if (!qword_45A68)
  {
    sub_6E48(&qword_45A30);
    sub_3198C(&qword_45A70, &qword_45A28, (void (*)(void))sub_31A30);
    sub_31AF4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_45A68);
  }
  return result;
}

uint64_t sub_3198C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_6E48(a2);
    a3();
    sub_E818(&qword_48F90, &qword_48F98);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_31A30()
{
  unint64_t result = qword_45A78;
  if (!qword_45A78)
  {
    sub_6E48(&qword_45A20);
    sub_E818(&qword_45A80, &qword_45A88);
    sub_E818(&qword_48F88, &qword_48F80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_45A78);
  }
  return result;
}

unint64_t sub_31AF4()
{
  unint64_t result = qword_45A90;
  if (!qword_45A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_45A90);
  }
  return result;
}

unint64_t sub_31B48()
{
  unint64_t result = qword_48FA0;
  if (!qword_48FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48FA0);
  }
  return result;
}

unint64_t sub_31BA8()
{
  unint64_t result = qword_48FA8;
  if (!qword_48FA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48FA8);
  }
  return result;
}

uint64_t sub_31C00()
{
  swift_release();
  sub_787C(*(void *)(v0 + 32), *(void *)(v0 + 40), *(unsigned char *)(v0 + 48));
  swift_release();

  return swift_deallocObject();
}

void *sub_31C4C()
{
  return sub_31414((void *)(v0 + 16));
}

uint64_t sub_31C68()
{
  return swift_deallocObject();
}

unint64_t sub_31C78()
{
  unint64_t result = qword_48FC8;
  if (!qword_48FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48FC8);
  }
  return result;
}

unint64_t sub_31CD8()
{
  unint64_t result = qword_45A98;
  if (!qword_45A98)
  {
    sub_6E48(&qword_45A40);
    sub_6E48(&qword_45A30);
    sub_318EC();
    swift_getOpaqueTypeConformance2();
    sub_31DB8(&qword_452F8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_45A98);
  }
  return result;
}

uint64_t sub_31DB8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_31E0C(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t destroy for WallpaperConfigurationCarouselItemView(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  char v3 = *(unsigned char *)(a1 + 16);

  return sub_155AC(v2, v3);
}

uint64_t _s17WallpaperSettings38WallpaperConfigurationCarouselItemViewVwCP_0(uint64_t a1, uint64_t a2)
{
  char v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 16);
  id v6 = v3;
  sub_31E0C(v4, v5);
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for WallpaperConfigurationCarouselItemView(uint64_t a1, void **a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *a2;
  char v5 = *(void **)a1;
  *(void *)a1 = *a2;
  id v6 = v4;

  uint64_t v7 = (uint64_t)v2[1];
  LOBYTE(v2) = *((unsigned char *)v2 + 16);
  sub_31E0C(v7, (char)v2);
  uint64_t v8 = *(void *)(a1 + 8);
  char v9 = *(unsigned char *)(a1 + 16);
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = (_BYTE)v2;
  sub_155AC(v8, v9);
  return a1;
}

uint64_t assignWithTake for WallpaperConfigurationCarouselItemView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  char v5 = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *(void *)(a1 + 8);
  char v7 = *(unsigned char *)(a1 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = v5;
  sub_155AC(v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for WallpaperConfigurationCarouselItemView(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 17)) {
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

uint64_t storeEnumTagSinglePayload for WallpaperConfigurationCarouselItemView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WallpaperConfigurationCarouselItemView()
{
  return &type metadata for WallpaperConfigurationCarouselItemView;
}

uint64_t sub_32028()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_32044@<D0>(void *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  if (a1)
  {
    id v7 = a1;
    char v8 = a3 & 1;
    sub_31E0C(a2, a3 & 1);
    uint64_t v9 = sub_15264(a2, a3 & 1);
    sub_155AC(a2, v8);
    type metadata accessor for WallpaperSnapshotPairViewModel();
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v7;
    *(void *)(v10 + 24) = v9;
    sub_324AC(&qword_49008, (void (*)(uint64_t))type metadata accessor for WallpaperSnapshotPairViewModel);
    swift_retain();
    sub_32C30();
    type metadata accessor for WallpaperSnapshotViewModel();
    swift_allocObject();
    id v11 = v7;
    sub_276D4(v11, 0, v9);
    swift_allocObject();
    id v12 = v11;
    sub_276D4(v12, 1, v9);
    swift_release();
    sub_32404();
    sub_32458();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_330A0();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    type metadata accessor for PosterConfigurationCarouselViewModel();
    sub_324AC((unint64_t *)&qword_483B8, (void (*)(uint64_t))type metadata accessor for PosterConfigurationCarouselViewModel);
    sub_32DA0();
    sub_32404();
    sub_32458();
    sub_330A0();
  }
  double result = *(double *)&v14;
  *(_OWORD *)a4 = v14;
  *(_OWORD *)(a4 + 16) = v15;
  *(unsigned char *)(a4 + 32) = v16;
  return result;
}

double sub_322C0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  sub_3239C(a1, (uint64_t)v8);
  char v5 = v9;
  *(double *)a2 = a3;
  double result = *(double *)v8;
  long long v7 = v8[1];
  *(_OWORD *)(a2 + 8) = v8[0];
  *(_OWORD *)(a2 + 24) = v7;
  *(unsigned char *)(a2 + 40) = v5;
  return result;
}

__n128 sub_32314@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void **)v1;
  uint64_t v4 = *(void *)(v1 + 8);
  char v5 = *(unsigned char *)(v1 + 16);
  uint64_t v6 = sub_335D0();
  uint64_t v8 = v7;
  sub_32044(v3, v4, v5, (uint64_t)v12);
  char v9 = v13;
  __n128 result = (__n128)v12[0];
  long long v11 = v12[1];
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v8;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v11;
  *(unsigned char *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = sub_322C0;
  *(void *)(a1 + 64) = 0;
  return result;
}

uint64_t sub_3239C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5CC8(&qword_487B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_32404()
{
  unint64_t result = qword_49010;
  if (!qword_49010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_49010);
  }
  return result;
}

unint64_t sub_32458()
{
  unint64_t result = qword_49018;
  if (!qword_49018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_49018);
  }
  return result;
}

uint64_t sub_324AC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_324F8()
{
  unint64_t result = qword_49020;
  if (!qword_49020)
  {
    sub_6E48(&qword_49028);
    sub_E818(&qword_49030, &qword_49038);
    sub_E818(&qword_49040, &qword_49048);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_49020);
  }
  return result;
}

ValueMetadata *type metadata accessor for SpringyOpacityScalingTransition()
{
  return &type metadata for SpringyOpacityScalingTransition;
}

uint64_t sub_325CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_325E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_32B80();
  sub_33610();
  sub_32B70();
  sub_32B90();
  swift_release();
  swift_release();
  sub_335E0();
  uint64_t v4 = sub_32BA0();
  swift_release();
  swift_release();
  uint64_t v5 = sub_5CC8(&qword_49050);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  uint64_t result = sub_5CC8(&qword_49058);
  *(void *)(a2 + *(int *)(result + 36)) = v4;
  return result;
}

unint64_t sub_326F0()
{
  unint64_t result = qword_49060;
  if (!qword_49060)
  {
    sub_6E48(&qword_49058);
    sub_E818(&qword_49068, &qword_49050);
    sub_E818(&qword_49070, &qword_49078);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_49060);
  }
  return result;
}

uint64_t sub_327B4()
{
  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for WallpaperSnapshotPairViewModel()
{
  return self;
}

uint64_t sub_32810()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_32820()
{
  return type metadata accessor for Notification();
}

uint64_t sub_32830()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_32840()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_32850()
{
  return LocalizedError.errorDescription.getter();
}

uint64_t sub_32860()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_32870()
{
  return _convertNSErrorToError(_:)();
}

void sub_32880(NSURL *retstr@<X8>)
{
}

uint64_t sub_32890()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_328A0()
{
  return URL.init(string:)();
}

uint64_t sub_328B0()
{
  return type metadata accessor for URL();
}

uint64_t sub_328C0()
{
  return UUID.uuidString.getter();
}

uint64_t sub_328D0()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_328E0()
{
  return type metadata accessor for UUID();
}

NSLocale sub_328F0()
{
  return Locale._bridgeToObjectiveC()();
}

uint64_t sub_32900()
{
  return static Locale.current.getter();
}

uint64_t sub_32910()
{
  return type metadata accessor for Locale();
}

uint64_t sub_32920()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_32930()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_32940()
{
  return OSSignpostID.init(log:)();
}

uint64_t sub_32950()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t sub_32960()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_32970()
{
  return OSSignposter.logHandle.getter();
}

uint64_t sub_32980()
{
  return OSSignposter.init(subsystem:category:)();
}

uint64_t sub_32990()
{
  return type metadata accessor for OSSignposter();
}

uint64_t sub_329A0()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t sub_329B0()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t sub_329C0()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t sub_329D0()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t sub_329E0()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t sub_329F0()
{
  return Logger.logObject.getter();
}

uint64_t sub_32A00()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_32A10()
{
  return type metadata accessor for Logger();
}

uint64_t sub_32A20()
{
  return UIMutableTraits.userInterfaceStyle.setter();
}

uint64_t sub_32A30()
{
  return type metadata accessor for UITraitUserInterfaceStyle();
}

uint64_t sub_32A40()
{
  return static ObservableObject.environmentStore.getter();
}

uint64_t sub_32A50()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_32A60()
{
  return Published.init(initialValue:)();
}

uint64_t sub_32A70()
{
  return static Published.subscript.getter();
}

uint64_t sub_32A80()
{
  return static Published.subscript.setter();
}

uint64_t sub_32A90()
{
  return type metadata accessor for Published();
}

uint64_t sub_32AA0()
{
  return Animatable<>.animatableData.modify();
}

uint64_t sub_32AB0()
{
  return static Animatable<>._makeAnimatable(value:inputs:)();
}

uint64_t sub_32AC0()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_32AD0()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t sub_32AE0()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_32AF0()
{
  return type metadata accessor for ControlSize();
}

uint64_t sub_32B00()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_32B10()
{
  return StateObject.wrappedValue.getter();
}

uint64_t sub_32B20()
{
  return ProgressView<>.init<>()();
}

uint64_t sub_32B30()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t sub_32B40()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t sub_32B50()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t sub_32B60()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_32B70()
{
  return static AnyTransition.scale(scale:anchor:)();
}

uint64_t sub_32B80()
{
  return static AnyTransition.opacity.getter();
}

uint64_t sub_32B90()
{
  return AnyTransition.combined(with:)();
}

uint64_t sub_32BA0()
{
  return AnyTransition.animation(_:)();
}

uint64_t sub_32BB0()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_32BC0()
{
  return LayoutSubview.sizeThatFits(_:)();
}

uint64_t sub_32BD0()
{
  return LayoutSubview.place(at:anchor:proposal:)();
}

uint64_t sub_32BE0()
{
  return type metadata accessor for LayoutSubview();
}

uint64_t sub_32BF0()
{
  return type metadata accessor for _TaskModifier();
}

uint64_t sub_32C00()
{
  return withAnimation<A>(_:_:)();
}

uint64_t sub_32C20()
{
  return type metadata accessor for LayoutSubviews();
}

uint64_t sub_32C30()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t sub_32C40()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t sub_32C50()
{
  return static LayoutDirection.== infix(_:_:)();
}

uint64_t sub_32C60()
{
  return type metadata accessor for LayoutDirection();
}

uint64_t sub_32C70()
{
  return ModifiedContent<>.accessibility(identifier:)();
}

uint64_t sub_32C80()
{
  return ModifiedContent<>.accessibilityHint<A>(_:)();
}

uint64_t sub_32C90()
{
  return ModifiedContent<>.accessibilityLabel(_:)();
}

uint64_t sub_32CA0()
{
  return ModifiedContent<>.accessibilityAction(_:_:)();
}

uint64_t sub_32CB0()
{
  return ModifiedContent<>.accessibilityAddTraits(_:)();
}

uint64_t sub_32CC0()
{
  return ModifiedContent<>.accessibilityRemoveTraits(_:)();
}

uint64_t sub_32CD0()
{
  return ScrollViewProxy.scrollTo<A>(_:anchor:)();
}

uint64_t sub_32CE0()
{
  return type metadata accessor for ScrollViewProxy();
}

uint64_t sub_32CF0()
{
  return PagingScrollView.init(behavior:axis:content:)();
}

uint64_t sub_32D00()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_32D10()
{
  return ScrollEventState.isAnimating.getter();
}

uint64_t sub_32D20()
{
  return ScrollEventState.isScrolling.getter();
}

uint64_t sub_32D30()
{
  return type metadata accessor for ScrollEventState();
}

uint64_t sub_32D40()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_32D50()
{
  return static ButtonBorderShape.capsule.getter();
}

uint64_t sub_32D60()
{
  return type metadata accessor for ButtonBorderShape();
}

uint64_t sub_32D70()
{
  return EnvironmentObject.projectedValue.getter();
}

uint64_t sub_32D80()
{
  return EnvironmentObject.error()();
}

uint64_t sub_32D90()
{
  return EnvironmentObject.Wrapper.subscript.getter();
}

uint64_t sub_32DA0()
{
  return EnvironmentObject.init()();
}

uint64_t sub_32DB0()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_32DC0()
{
  return EnvironmentValues.imageScale.setter();
}

uint64_t sub_32DD0()
{
  return EnvironmentValues.controlSize.getter();
}

uint64_t sub_32DE0()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t sub_32DF0()
{
  return EnvironmentValues.dynamicTypeSize.setter();
}

uint64_t sub_32E00()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_32E10()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_32E20()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t sub_32E30()
{
  return EnvironmentValues.layoutDirection.setter();
}

uint64_t sub_32E40()
{
  return EnvironmentValues._buttonBorderShape.getter();
}

uint64_t sub_32E50()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_32E60()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_32E70()
{
  return EnvironmentValues.textCase.getter();
}

uint64_t sub_32E80()
{
  return EnvironmentValues.textCase.setter();
}

uint64_t sub_32E90()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_32EA0()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_32EB0()
{
  return EnvironmentValues.tintColor.getter();
}

uint64_t sub_32EC0()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t sub_32ED0()
{
  return EnvironmentValues.init()();
}

uint64_t sub_32EE0()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_32EF0()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t sub_32F00()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t sub_32F10()
{
  return type metadata accessor for NavigationBarItem.TitleDisplayMode();
}

uint64_t sub_32F20()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_32F30()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_32F40()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_32F50()
{
  return static AccessibilityTraits.isImage.getter();
}

uint64_t sub_32F60()
{
  return static AccessibilityTraits.isButton.getter();
}

uint64_t sub_32F70()
{
  return type metadata accessor for AccessibilityTraits();
}

uint64_t sub_32F80()
{
  return BorderedButtonStyle.init()();
}

uint64_t sub_32F90()
{
  return type metadata accessor for BorderedButtonStyle();
}

uint64_t sub_32FA0()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_32FB0()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_32FC0()
{
  return LazyFixedSizeHStack.init(width:alignment:spacing:content:)();
}

uint64_t sub_32FD0()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_32FE0()
{
  return UIViewRepresentable._resetUIView(_:coordinator:destroy:)();
}

uint64_t sub_32FF0()
{
  return static UIViewRepresentable.dismantleUIView(_:coordinator:)();
}

uint64_t sub_33000()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t sub_33020()
{
  return static UIViewRepresentable._layoutOptions(_:)();
}

uint64_t sub_33030()
{
  return UIViewRepresentable._identifiedViewTree(in:)();
}

uint64_t sub_33040()
{
  return UIViewRepresentable._overrideLayoutTraits(_:for:)();
}

uint64_t sub_33050()
{
  return UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)();
}

uint64_t sub_33060()
{
  return static UIViewRepresentable._modifyBridgedViewInputs(_:)();
}

uint64_t sub_33070()
{
  return UIViewRepresentable.body.getter();
}

uint64_t sub_33090()
{
  return UIViewRepresentable<>.makeCoordinator()();
}

uint64_t sub_330A0()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_330B0()
{
  return static ScrollPagingBehavior.childPaging.getter();
}

uint64_t sub_330C0()
{
  return type metadata accessor for ScrollPagingBehavior();
}

uint64_t sub_330D0()
{
  return BorderlessButtonStyle.init()();
}

uint64_t sub_330E0()
{
  return type metadata accessor for BorderlessButtonStyle();
}

uint64_t sub_330F0()
{
  return type metadata accessor for _ViewModifier_Content();
}

uint64_t sub_33100()
{
  return ScrollEventStateReader.init(content:)();
}

uint64_t sub_33110()
{
  return static AccessibilityActionKind.default.getter();
}

uint64_t sub_33120()
{
  return type metadata accessor for AccessibilityActionKind();
}

uint64_t sub_33130()
{
  return CircularProgressViewStyle.init()();
}

uint64_t sub_33140()
{
  return type metadata accessor for CircularProgressViewStyle();
}

uint64_t sub_33150()
{
  return static ScrollIndicatorVisibility.hidden.getter();
}

uint64_t sub_33160()
{
  return type metadata accessor for ScrollIndicatorVisibility();
}

uint64_t sub_33170()
{
  return static AccessibilityChildBehavior.ignore.getter();
}

uint64_t sub_33180()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t sub_33190()
{
  return UIViewRepresentableContext.coordinator.getter();
}

uint64_t sub_331A0()
{
  return type metadata accessor for UIViewRepresentableContext();
}

uint64_t sub_331B0()
{
  return BorderedProminentButtonStyle.init()();
}

uint64_t sub_331C0()
{
  return type metadata accessor for BorderedProminentButtonStyle();
}

uint64_t sub_331D0()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_331E0()
{
  return static Axis.Set.horizontal.getter();
}

uint64_t sub_331F0()
{
  return Axis.Set.init(rawValue:)();
}

uint64_t sub_33200()
{
  return static Axis.Set.vertical.getter();
}

uint64_t sub_33210()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t sub_33220()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_33230()
{
  return static Edge.Set.vertical.getter();
}

uint64_t sub_33240()
{
  return static Font.subheadline.getter();
}

uint64_t sub_33250()
{
  return Font.bold()();
}

uint64_t sub_33260()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_33270()
{
  return static Font.Weight.regular.getter();
}

uint64_t sub_33280()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_33290()
{
  return static Font.headline.getter();
}

uint64_t sub_332A0()
{
  return List<>.init(content:)();
}

uint64_t sub_332B0()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_332C0()
{
  return static Text.+ infix(_:_:)();
}

uint64_t sub_332D0()
{
  return type metadata accessor for Text.Case();
}

uint64_t sub_332E0()
{
  return Text.bold()();
}

uint64_t sub_332F0()
{
  return Text.font(_:)();
}

uint64_t sub_33300()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_33310()
{
  return Text.init(_:)();
}

uint64_t sub_33320()
{
  return View.settingsListAppearance()();
}

uint64_t sub_33330()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_33340()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_33350()
{
  return View.progressViewStyle<A>(_:)();
}

uint64_t sub_33360()
{
  return View.fontWeight(_:)();
}

uint64_t sub_33370()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_33380()
{
  return View.accessibility(identifier:)();
}

uint64_t sub_33390()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_333A0()
{
  return View.scrollIndicators(_:axes:)();
}

uint64_t sub_333B0()
{
  return View.hyphenationFactor(_:)();
}

uint64_t sub_333C0()
{
  return View.accessibilityLabel(_:)();
}

uint64_t sub_333D0()
{
  return View.accessibilityLabel<A>(_:)();
}

uint64_t sub_333E0()
{
  return View.navigationBarTitle(_:displayMode:)();
}

uint64_t sub_333F0()
{
  return View.accessibilityElement(children:)();
}

uint64_t sub_33400()
{
  return View.scrollContentPadding(_:_:)();
}

uint64_t sub_33410()
{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t sub_33420()
{
  return static Color.blue.getter();
}

uint64_t sub_33430()
{
  return static Color.gray.getter();
}

uint64_t sub_33440()
{
  return static Color.white.getter();
}

uint64_t sub_33450()
{
  return static Color.secondary.getter();
}

uint64_t sub_33460()
{
  return Color.init(_:)();
}

uint64_t sub_33470()
{
  return Image.init(uiImage:)();
}

uint64_t sub_33480()
{
  return Image.init(systemName:)();
}

uint64_t sub_33490()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_334A0()
{
  return type metadata accessor for Image.Scale();
}

uint64_t sub_334B0()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_334C0()
{
  return Button.init(action:label:)();
}

uint64_t sub_334D0()
{
  return static Layout._makeLayoutView(root:inputs:body:)();
}

uint64_t sub_334E0()
{
  return Layout.updateCache(_:subviews:)();
}

uint64_t sub_334F0()
{
  return static Layout.layoutProperties.getter();
}

uint64_t sub_33500()
{
  return Layout.spacing(subviews:cache:)();
}

uint64_t sub_33510()
{
  return Layout<>.makeCache(subviews:)();
}

uint64_t sub_33520()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_33530()
{
  return Binding.wrappedValue.getter();
}

uint64_t sub_33540()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_33550()
{
  return Binding.subscript.getter();
}

uint64_t sub_33560()
{
  return type metadata accessor for Binding();
}

uint64_t sub_33570()
{
  return type metadata accessor for Capsule();
}

uint64_t sub_33580()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_33590()
{
  return Section<>.init(content:)();
}

uint64_t sub_335A0()
{
  return static Material.coreMaterial(bundle:provider:)();
}

uint64_t sub_335B0()
{
  return type metadata accessor for Material();
}

uint64_t sub_335C0()
{
  return static Alignment.bottom.getter();
}

uint64_t sub_335D0()
{
  return static Alignment.center.getter();
}

uint64_t sub_335E0()
{
  return static Animation.spring(response:dampingFraction:blendDuration:)();
}

uint64_t sub_335F0()
{
  return static Animation.default.getter();
}

uint64_t sub_33600()
{
  return static UnitPoint.topLeading.getter();
}

uint64_t sub_33610()
{
  return static UnitPoint.center.getter();
}

uint64_t sub_33620()
{
  return static UnitPoint.leading.getter();
}

uint64_t sub_33630()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_33640()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_33650()
{
  return static DispatchQoS.userInitiated.getter();
}

uint64_t sub_33660()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary sub_33670()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_33680()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_33690()
{
  return dispatch thunk of BidirectionalCollection.index(before:)();
}

uint64_t sub_336A0()
{
  return BidirectionalCollection<>.difference<A>(from:)();
}

uint64_t sub_336B0()
{
  return type metadata accessor for ClosedRange();
}

uint64_t sub_336C0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_336D0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_336E0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_336F0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_33700()
{
  return String.hash(into:)();
}

void sub_33710(Swift::String contentsOf)
{
}

void sub_33720(Swift::String a1)
{
}

Swift::Int sub_33730()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_33740()
{
  return Sequence<>.contains(_:)();
}

NSArray sub_33750()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_33760()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_33770()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_33790()
{
  return static MainActor.shared.getter();
}

uint64_t sub_337A0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_337B0()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t sub_337C0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_337D0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_337E0()
{
  return AsyncStream.Continuation.onTermination.setter();
}

uint64_t sub_337F0()
{
  return AsyncStream.Continuation.yield(_:)();
}

uint64_t sub_33800()
{
  return AsyncStream.makeAsyncIterator()();
}

uint64_t sub_33820()
{
  return AsyncStream.init(_:bufferingPolicy:_:)();
}

void sub_33830()
{
}

uint64_t sub_33840()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t sub_33850()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t sub_33860()
{
  return dispatch thunk of Collection.indices.getter();
}

uint64_t sub_33870()
{
  return dispatch thunk of Collection.isEmpty.getter();
}

uint64_t sub_33880()
{
  return dispatch thunk of Collection.distance(from:to:)();
}

uint64_t sub_33890()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t sub_338A0()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t sub_338B0()
{
  return Collection<>.firstIndex(of:)();
}

uint64_t sub_338C0()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t sub_338D0()
{
  return RangeReplaceableCollection.applying(_:)();
}

uint64_t sub_338E0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_338F0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_33900()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_33910()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_33920()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_33930()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_33940()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_33950()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_33960()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_33970()
{
  return UITraitCollection.modifyingTraits(_:)();
}

uint64_t sub_33980()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_33990()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t sub_339A0()
{
  return NSNotificationCenter.Notifications.makeAsyncIterator()();
}

uint64_t sub_339B0()
{
  return type metadata accessor for NSNotificationCenter.Notifications.Iterator();
}

uint64_t sub_339C0()
{
  return NSNotificationCenter.notifications(named:object:)();
}

uint64_t sub_339D0()
{
  return UIView.registerForTraitChanges<A>(_:handler:)();
}

Swift::Int sub_339E0(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_339F0()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_33A00()
{
  return NSObject.hash(into:)();
}

uint64_t sub_33A10()
{
  return NSObject.hashValue.getter();
}

uint64_t sub_33A20()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t sub_33A30()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_33A40()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_33A50()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Int sub_33A60(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_33A70()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_33A80()
{
  return AnyHashable.init<A>(_:)();
}

void sub_33A90(Swift::Int a1)
{
}

uint64_t sub_33AA0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_33AB0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_33AC0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_33AD0()
{
  return __CocoaDictionary.startIndex.getter();
}

uint64_t sub_33AE0()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t sub_33AF0()
{
  return static __CocoaDictionary.Index.== infix(_:_:)();
}

uint64_t sub_33B00()
{
  return __CocoaDictionary.Index.age.getter();
}

uint64_t sub_33B10()
{
  return __CocoaDictionary.Index.key.getter();
}

uint64_t sub_33B20()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t sub_33B30()
{
  return __CocoaDictionary.Iterator.next()();
}

uint64_t sub_33B40()
{
  return __CocoaDictionary.endIndex.getter();
}

uint64_t sub_33B50()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_33B60()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_33B70()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_33B80()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_33B90()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_33BA0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_33BB0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_33BC0()
{
  return max<A>(_:_:)();
}

uint64_t sub_33BD0()
{
  return min<A>(_:_:)();
}

uint64_t sub_33BE0()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_33BF0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_33C00()
{
  return Error._code.getter();
}

uint64_t sub_33C10()
{
  return Error._domain.getter();
}

uint64_t sub_33C20()
{
  return Error._userInfo.getter();
}

uint64_t sub_33C30()
{
  return Hasher.init(_seed:)();
}

void sub_33C40(Swift::UInt a1)
{
}

Swift::Int sub_33C50()
{
  return Hasher._finalize()();
}

uint64_t BSInterfaceOrientationDescription()
{
  return _BSInterfaceOrientationDescription();
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DMakeScale(retstr, sx, sy, sz);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
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

uint64_t PBUIStringForWallpaperVariant()
{
  return _PBUIStringForWallpaperVariant();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return _dispatch_workloop_create_inactive(label);
}

void dispatch_workloop_set_autorelease_frequency(dispatch_workloop_t workloop, dispatch_autorelease_frequency_t frequency)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
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

uint64_t swift_asyncLet_begin()
{
  return _swift_asyncLet_begin();
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_deallocObject()
{
  return _swift_deallocObject();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return _swift_getOpaqueTypeMetadata2();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
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

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_createWorkloopWithLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createWorkloopWithLabel:");
}