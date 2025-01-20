void sub_290C()
{
  char *v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t vars8;

  v1 = v0;
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v2 = OBJC_IVAR____TtC21ControlCenterSettings20AnimatingPackageView_packageLayer;
  v3 = *(id *)&v0[OBJC_IVAR____TtC21ControlCenterSettings20AnimatingPackageView_packageLayer];
  swift_release();
  [v3 removeFromSuperlayer];

  v4 = *(void **)&v0[OBJC_IVAR____TtC21ControlCenterSettings20AnimatingPackageView_package];
  if (v4)
  {
    v12 = v4;
    v5 = [v12 rootLayer];
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "setGeometryFlipped:", objc_msgSend(v12, "isGeometryFlipped"));
      [v6 setContentsGravity:kCAGravityResizeAspect];
      objc_msgSend(v6, "setAnchorPoint:", 0.5, 0.0);
      [v6 setMasksToBounds:1];
      [v6 setFillMode:kCAFillModeBackwards];
      v11 = v6;
      sub_9F40();
      sub_9F30();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      v7 = *(void **)&v0[v2];
      *(void *)&v0[v2] = v6;
      swift_release();

      v8 = [v0 layer];
      [v8 setShouldRasterize:1];

      v9 = [v1 layer];
      [v9 addSublayer:v11];

      [v1 invalidateIntrinsicContentSize];
      swift_release();

      v10 = v11;
    }
    else
    {
      swift_release();
      v10 = v12;
    }
  }
  else
  {
    swift_release();
  }
}

id sub_2C18(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR____TtC21ControlCenterSettings20AnimatingPackageView_package] = 0;
  v4[OBJC_IVAR____TtC21ControlCenterSettings20AnimatingPackageView_animating] = 0;
  *(void *)&v4[OBJC_IVAR____TtC21ControlCenterSettings20AnimatingPackageView_packageLayer] = 0;
  v16.receiver = v4;
  v16.super_class = (Class)type metadata accessor for AnimatingPackageView();
  id v9 = objc_msgSendSuper2(&v16, "initWithFrame:", a1, a2, a3, a4);
  [v9 setUserInteractionEnabled:0];
  v10 = self;
  id v11 = v9;
  id v12 = [v10 clearColor];
  [v11 setBackgroundColor:v12];

  sub_3044();
  sub_4218(&qword_105E0);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_A5A0;
  *(void *)(v13 + 32) = sub_9B30();
  *(void *)(v13 + 40) = &protocol witness table for UITraitUserInterfaceStyle;
  id v14 = v11;
  sub_9FD0();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return v14;
}

uint64_t sub_2DA0(unsigned __int8 *a1)
{
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  int v2 = a1[OBJC_IVAR____TtC21ControlCenterSettings20AnimatingPackageView_animating];
  swift_release();
  sub_3738();
  sub_3044();
  [a1 setNeedsDisplay];
  if (v2 == 1) {
    sub_3508();
  }

  return swift_release();
}

uint64_t sub_3044()
{
  uint64_t v1 = v0;
  sub_4218(&qword_105D0);
  ((void (*)(void))__chkstk_darwin)();
  v3 = &v17[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_9AD0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = &v17[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v6);
  v10 = &v17[-v9];
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_3DEC((uint64_t)v3);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_42C4((uint64_t)v3);
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 32))(v10, v3, v4);
    sub_4324();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 16))(v8, v10, v4);
    uint64_t v11 = sub_9F10();
    id v13 = sub_3340((uint64_t)v8, v11, v12, 0);
    sub_9F40();
    sub_9F30();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v14 = *(void **)(v0 + OBJC_IVAR____TtC21ControlCenterSettings20AnimatingPackageView_package);
    *(void *)(v1 + OBJC_IVAR____TtC21ControlCenterSettings20AnimatingPackageView_package) = v13;
    id v15 = v13;

    sub_290C();
    swift_release();

    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v10, v4);
  }
  return swift_release();
}

id sub_3340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_9AA0(__stack_chk_guard);
  uint64_t v7 = v6;
  NSString v8 = sub_9F00();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v9.super.isa = sub_9EC0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  id v18 = 0;
  id v10 = [(id)swift_getObjCClassFromMetadata() packageWithContentsOfURL:v7 type:v8 options:v9.super.isa error:&v18];

  id v11 = v18;
  if (v10)
  {
    uint64_t v12 = sub_9AD0();
    id v13 = *(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8);
    id v14 = v11;
    v13(a1, v12);
  }
  else
  {
    id v15 = v18;
    sub_9A60();

    swift_willThrow();
    uint64_t v16 = sub_9AD0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a1, v16);
  }
  return v10;
}

void sub_3508()
{
  uint64_t v1 = v0;
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *((unsigned char *)v0 + OBJC_IVAR____TtC21ControlCenterSettings20AnimatingPackageView_animating) = 1;
  swift_release();
  id v2 = [v0 layer];
  [v2 timeOffset];
  double v4 = v3;

  id v5 = [v1 layer];
  LODWORD(v6) = 1.0;
  [v5 setSpeed:v6];

  id v7 = [v1 layer];
  [v7 setTimeOffset:0.0];

  id v8 = [v1 layer];
  [v8 setBeginTime:0.0];

  id v9 = [v1 layer];
  [v9 convertTime:0 fromLayer:CACurrentMediaTime()];
  double v11 = v10;

  id v12 = [v1 layer];
  [v12 setBeginTime:v11 - v4];
  swift_release();
}

void sub_3738()
{
  uint64_t v1 = v0;
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *((unsigned char *)v0 + OBJC_IVAR____TtC21ControlCenterSettings20AnimatingPackageView_animating) = 0;
  swift_release();
  id v2 = [v0 layer];
  [v2 convertTime:0 fromLayer:CACurrentMediaTime()];
  double v4 = v3;

  id v5 = [v1 layer];
  [v5 setSpeed:0.0];

  id v6 = [v1 layer];
  [v6 setTimeOffset:v4];
  swift_release();
}

void sub_38E0(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v9 = *(void **)(v4 + OBJC_IVAR____TtC21ControlCenterSettings20AnimatingPackageView_packageLayer);
  id v10 = v9;
  swift_release();
  if (v9)
  {
    v14.origin.x = a1;
    v14.origin.y = a2;
    v14.size.width = a3;
    v14.size.height = a4;
    double MidX = CGRectGetMidX(v14);
    v15.origin.x = a1;
    v15.origin.y = a2;
    v15.size.width = a3;
    v15.size.height = a4;
    objc_msgSend(v10, "setPosition:", MidX, CGRectGetMinY(v15));
    CATransform3DMakeScale(&v12, 0.333333333, 0.333333333, 1.0);
    [v10 setTransform:&v12];
    swift_release();
  }
  else
  {
    swift_release();
  }
}

double sub_3C84()
{
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC21ControlCenterSettings20AnimatingPackageView_packageLayer);
  id v2 = v1;
  swift_release();
  if (v1)
  {
    [v2 bounds];
    double v4 = v3 * 0.333333333;
    [v2 bounds];
    swift_release();
  }
  else
  {
    double v4 = UIViewNoIntrinsicMetric;
    swift_release();
  }
  return v4;
}

id sub_3DEC@<X0>(uint64_t a1@<X8>)
{
  id v2 = v1;
  sub_4218(&qword_105D0);
  __chkstk_darwin();
  id v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v22[0] = 0xD000000000000018;
  v22[1] = 0x800000000000AEB0;
  id result = [self standardDefaults];
  if (result)
  {
    id v7 = result;
    id v8 = (char *)[result presentationGesture];

    if (v8 == (unsigned char *)&dword_0 + 1)
    {
      id v9 = [v2 traitCollection];
      id v10 = (char *)[v9 userInterfaceIdiom];

      if (v10 == (unsigned char *)&dword_0 + 1)
      {
        v11._countAndFlagsBits = 1684099117;
        v11._object = (void *)0xE400000000000000;
      }
      else
      {
        v11._countAndFlagsBits = 0x656E6F68502DLL;
        v11._object = (void *)0xE600000000000000;
      }
    }
    else
    {
      v11._object = (void *)0x800000000000AED0;
      v11._countAndFlagsBits = 0xD000000000000010;
    }
    sub_9F20(v11);
    id v12 = [v2 traitCollection];
    id v13 = (char *)[v12 userInterfaceStyle];

    if (v13 == (unsigned char *)&dword_0 + 2)
    {
      v14._countAndFlagsBits = 0x6B7261442DLL;
      v14._object = (void *)0xE500000000000000;
    }
    else
    {
      v14._countAndFlagsBits = 0x746867694C2DLL;
      v14._object = (void *)0xE600000000000000;
    }
    sub_9F20(v14);
    if ([v2 effectiveUserInterfaceLayoutDirection]) {
      v15._countAndFlagsBits = 1280594477;
    }
    else {
      v15._countAndFlagsBits = 1381256237;
    }
    v15._object = (void *)0xE400000000000000;
    sub_9F20(v15);
    if (qword_10570 != -1) {
      swift_once();
    }
    uint64_t v16 = (void *)qword_10AD0;
    NSString v17 = sub_9F00();
    swift_bridgeObjectRelease();
    NSString v18 = sub_9F00();
    id v19 = [v16 URLForResource:v17 withExtension:v18];

    if (v19)
    {
      sub_9AB0();

      uint64_t v20 = sub_9AD0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v5, 0, 1, v20);
    }
    else
    {
      uint64_t v21 = sub_9AD0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v5, 1, 1, v21);
    }
    sub_425C((uint64_t)v5, a1);
    return (id)swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_4174()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnimatingPackageView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AnimatingPackageView()
{
  return self;
}

uint64_t sub_4218(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_425C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4218(&qword_105D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_42C4(uint64_t a1)
{
  uint64_t v2 = sub_4218(&qword_105D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_4324()
{
  unint64_t result = qword_105D8;
  if (!qword_105D8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_105D8);
  }
  return result;
}

uint64_t sub_4364()
{
  *(void *)&v0[OBJC_IVAR____TtC21ControlCenterSettings20AnimatingPackageView_package] = 0;
  v0[OBJC_IVAR____TtC21ControlCenterSettings20AnimatingPackageView_animating] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21ControlCenterSettings20AnimatingPackageView_packageLayer] = 0;

  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  uint64_t result = sub_9FF0();
  __break(1u);
  return result;
}

Swift::Void __swiftcall ControlCenterSettingsViewController.viewDidLoad()()
{
  uint64_t v1 = v0;
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v29.receiver = v0;
  v29.super_class = (Class)ControlCenterSettingsViewController;
  objc_msgSendSuper2(&v29, "viewDidLoad");
  id v2 = [self sharedConnection];
  if (!v2)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  double v3 = v2;
  [v2 effectiveBoolValueForSetting:MCFeatureControlCenterInAppsAllowed];

  id v4 = v1;
  sub_9DB0();
  char v5 = v25;
  uint64_t v6 = v27;
  sub_9DB0();
  char v7 = v25;
  uint64_t v8 = v27;
  id v26 = v4;
  LOBYTE(v27) = v5;
  LOBYTE(v28) = v7;
  objc_allocWithZone((Class)sub_4218(&qword_105E8));
  swift_retain();
  id v9 = v4;
  swift_retain();
  id v10 = (void *)sub_9BD0();
  if (qword_10570 != -1) {
    swift_once();
  }
  Swift::String v11 = (void *)qword_10AD0;
  NSString v12 = sub_9F00();
  id v13 = objc_msgSend(v11, "localizedStringForKey:value:table:", v12, 0, 0, v26, v27, v6, v28, v8);

  sub_9F10();
  NSString v14 = sub_9F00();
  swift_bridgeObjectRelease();
  [v9 setTitle:v14];

  id v15 = [v10 view];
  if (!v15)
  {
    uint64_t v16 = v10;
    goto LABEL_11;
  }
  uint64_t v16 = v15;
  id v17 = [v9 view];
  if (!v17) {
    goto LABEL_13;
  }
  NSString v18 = v17;
  [v17 addSubview:v16];

  id v19 = [v9 view];
  if (v19)
  {
    uint64_t v20 = v19;
    [v19 bounds];
    double v22 = v21;
    double v24 = v23;

    objc_msgSend(v16, "setFrame:", 0.0, 0.0, v22, v24);
    [v16 setAutoresizingMask:18];
    [v9 addChildViewController:v10];
    [v10 didMoveToParentViewController:v9];

    id v9 = v10;
LABEL_11:

    swift_release();
    swift_release();
    swift_release();
    return;
  }
LABEL_14:
  __break(1u);
}

uint64_t sub_49F8(char a1, uint64_t a2)
{
  uint64_t v4 = sub_9B20();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v6);
  id v10 = &v18[-v9];
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a1)
  {
    sub_9B10();
    Swift::String v11 = sub_9B00();
    os_log_type_t v12 = sub_9FC0();
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_0, v11, v12, "Successfully reset Control Center layout to default.", v13, 2u);
      swift_slowDealloc();
    }
    uint64_t v8 = v10;
  }
  else
  {
    sub_9B10();
    swift_errorRetain();
    swift_errorRetain();
    Swift::String v11 = sub_9B00();
    int v14 = sub_9FB0();
    if (os_log_type_enabled(v11, (os_log_type_t)v14))
    {
      int v19 = v14;
      id v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = (void *)swift_slowAlloc();
      *(_DWORD *)id v15 = 138412290;
      sub_9F40();
      sub_9F30();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_errorRetain();
      swift_release();
      if (a2)
      {
        uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v21 = v16;
        sub_9FE0();
      }
      else
      {
        uint64_t v21 = 0;
        sub_9FE0();
        uint64_t v16 = 0;
      }
      *uint64_t v20 = v16;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v11, (os_log_type_t)v19, "Failed to reset Control Center layout to default with %@.", v15, 0xCu);
      sub_4218(&qword_10620);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }
  }

  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
  return swift_release();
}

void sub_4DBC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void __swiftcall ControlCenterSettingsViewController.init(nibName:bundle:)(ControlCenterSettingsViewController *__return_ptr retstr, Swift::String_optional nibName, NSBundle_optional bundle)
{
  Class isa = bundle.value.super.isa;
  if (nibName.value._object)
  {
    NSString v4 = sub_9F00();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }
  [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithNibName:v4 bundle:isa];
}

id ControlCenterSettingsViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = sub_9F00();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)ControlCenterSettingsViewController;
  id v6 = objc_msgSendSuper2(&v8, "initWithNibName:bundle:", v5, a3);

  return v6;
}

void __swiftcall ControlCenterSettingsViewController.init(coder:)(ControlCenterSettingsViewController_optional *__return_ptr retstr, NSCoder coder)
{
}

id ControlCenterSettingsViewController.init(coder:)(void *a1)
{
  v4.super_class = (Class)ControlCenterSettingsViewController;
  id v2 = objc_msgSendSuper2(&v4, "initWithCoder:", a1);

  return v2;
}

unint64_t type metadata accessor for ControlCenterSettingsViewController()
{
  unint64_t result = qword_10618;
  if (!qword_10618)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10618);
  }
  return result;
}

void sub_5274()
{
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v0 = [self sharedInstance];
  v2[4] = sub_49F8;
  v2[5] = 0;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 1107296256;
  v2[2] = sub_4DBC;
  v2[3] = &unk_CA00;
  uint64_t v1 = _Block_copy(v2);
  [v0 resetToDefaultLayoutWithCompletionHandler:v1];
  _Block_release(v1);
  swift_release();
}

uint64_t sub_53A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_53B8()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for AnimatingView()
{
  return &type metadata for AnimatingView;
}

void *sub_53D0()
{
  return &protocol witness table for Never;
}

id sub_53DC()
{
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v0 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AnimatingPackageView()), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  swift_release();
  return v0;
}

uint64_t sub_5490()
{
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_3508();

  return swift_release();
}

uint64_t sub_5540()
{
  return sub_9C00();
}

uint64_t sub_5584(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_56E8();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_55E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_56E8();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_564C()
{
  return sub_9D50();
}

void sub_5668()
{
}

unint64_t sub_5694()
{
  unint64_t result = qword_10628;
  if (!qword_10628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10628);
  }
  return result;
}

unint64_t sub_56E8()
{
  unint64_t result = qword_10630;
  if (!qword_10630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10630);
  }
  return result;
}

id sub_573C()
{
  _s2__CMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_10AD0 = (uint64_t)result;
  return result;
}

uint64_t sub_5794()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t _s2__CMa()
{
  return self;
}

ValueMetadata *type metadata accessor for TutorialLayout()
{
  return &type metadata for TutorialLayout;
}

unint64_t sub_57DC()
{
  unint64_t result = qword_106D0;
  if (!qword_106D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_106D0);
  }
  return result;
}

uint64_t sub_5830@<X0>(uint64_t a1@<X8>)
{
  sub_9BB0();
  sub_65D4(&qword_106E8);
  sub_9F60();
  sub_9F90();
  if (v9[4] == v9[0])
  {
    uint64_t v2 = sub_9BA0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(a1, 1, 1, v2);
  }
  else
  {
    objc_super v4 = (void (*)(void *, void))sub_9FA0();
    uint64_t v6 = v5;
    uint64_t v7 = sub_9BA0();
    uint64_t v8 = *(void *)(v7 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(a1, v6, v7);
    v4(v9, 0);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  }
}

double sub_59C8(uint64_t a1, char a2)
{
  return sub_5BB8(a1, a2 & 1);
}

uint64_t sub_59D8(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  return sub_602C(a7, a8 & 1, a1, a2, a3, a4);
}

uint64_t sub_59EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_5A5C(a1, a2, a3, a4, a5, a6, a7, a8, a9, (uint64_t (*)(uint64_t))&Layout.explicitAlignment(of:in:proposal:subviews:cache:));
}

uint64_t sub_5A24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_5A5C(a1, a2, a3, a4, a5, a6, a7, a8, a9, (uint64_t (*)(uint64_t))&Layout.explicitAlignment(of:in:proposal:subviews:cache:));
}

uint64_t sub_5A5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t))
{
  return a10(a1);
}

void (*sub_5AA4(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_9B40();
  return sub_5B14;
}

void sub_5B14(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

unint64_t sub_5B64()
{
  unint64_t result = qword_106D8;
  if (!qword_106D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_106D8);
  }
  return result;
}

double sub_5BB8(uint64_t a1, int a2)
{
  int v36 = a2;
  uint64_t v3 = sub_4218(&qword_106E0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v30 - v7;
  uint64_t v9 = sub_9BA0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  id v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  id v15 = (char *)&v30 - v14;
  sub_9BB0();
  sub_65D4(&qword_106E8);
  sub_9F60();
  sub_9F90();
  double v16 = 0.0;
  if (sub_9F80() == 2)
  {
    v34 = v6;
    v35 = v15;
    char v17 = v36;
    double v32 = *(double *)&a1;
    v33 = v13;
    sub_5830((uint64_t)v8);
    NSString v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
    if (v18(v8, 1, v9) == 1)
    {
      uint64_t v19 = (uint64_t)v8;
LABEL_8:
      sub_6574(v19);
      return v16;
    }
    uint64_t v20 = v10;
    uint64_t v21 = v8;
    double v22 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v22(v35, v21, v9);
    if (sub_9F70())
    {
      uint64_t v23 = (uint64_t)v34;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v34, 1, 1, v9);
LABEL_7:
      (*(void (**)(char *, uint64_t))(v20 + 8))(v35, v9);
      uint64_t v19 = v23;
      goto LABEL_8;
    }
    v31 = (void (*)(char *, uint64_t, uint64_t))v22;
    sub_9F90();
    sub_65D4(&qword_106F0);
    sub_9ED0();
    double v24 = (void (*)(char *, void))sub_9FA0();
    uint64_t v23 = (uint64_t)v34;
    (*(void (**)(char *))(v20 + 16))(v34);
    v24(v37, 0);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v20 + 56))(v23, 0, 1, v9);
    if (v18((char *)v23, 1, v9) == 1) {
      goto LABEL_7;
    }
    id v26 = v33;
    v31(v33, v23, v9);
    uint64_t v27 = v35;
    if (v17)
    {
      objc_super v29 = *(void (**)(char *, uint64_t))(v20 + 8);
      v29(v26, v9);
      v29(v27, v9);
    }
    else
    {
      double v16 = v32;
      v37[0] = 0;
      char v38 = 1;
      sub_9B80();
      v37[0] = 0;
      char v38 = 1;
      sub_9B80();
      uint64_t v28 = *(void (**)(char *, uint64_t))(v20 + 8);
      v28(v26, v9);
      v28(v27, v9);
    }
  }
  return v16;
}

uint64_t sub_602C(uint64_t a1, int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  LODWORD(v39) = a2;
  uint64_t v11 = sub_4218(&qword_106E0);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  double v16 = (char *)&v35 - v15;
  uint64_t v17 = sub_9BA0();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v35 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v35 - v22;
  sub_9BB0();
  sub_65D4(&qword_106E8);
  sub_9F60();
  sub_9F90();
  uint64_t result = sub_9F80();
  if (result == 2)
  {
    uint64_t v37 = a1;
    char v38 = v21;
    sub_5830((uint64_t)v16);
    char v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
    if (v25(v16, 1, v17) == 1) {
      return sub_6574((uint64_t)v16);
    }
    id v26 = *(void (**)(void))(v18 + 32);
    int v36 = v23;
    uint64_t v27 = v26;
    v26();
    if (sub_9F70())
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v14, 1, 1, v17);
LABEL_7:
      (*(void (**)(char *, uint64_t))(v18 + 8))(v36, v17);
      return sub_6574((uint64_t)v14);
    }
    sub_9F90();
    sub_65D4(&qword_106F0);
    sub_9ED0();
    uint64_t v28 = (void (*)(char *, void))sub_9FA0();
    (*(void (**)(char *))(v18 + 16))(v14);
    v28(v40, 0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v14, 0, 1, v17);
    if (v25(v14, 1, v17) == 1) {
      goto LABEL_7;
    }
    objc_super v29 = v38;
    ((void (*)(char *, char *, uint64_t))v27)(v38, v14, v17);
    v42.origin.x = a3;
    v42.origin.y = a4;
    v42.size.width = a5;
    v42.size.height = a6;
    CGRectGetWidth(v42);
    v40[0] = 0;
    char v30 = v39 & 1;
    char v41 = v39 & 1;
    v31 = v36;
    sub_9B80();
    uint64_t v35 = v32;
    v43.origin.x = a3;
    v43.origin.y = a4;
    v43.size.width = a5;
    v43.size.height = a6;
    CGRectGetWidth(v43);
    v40[0] = 0;
    char v41 = v30;
    sub_9B80();
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
    sub_9EA0();
    v40[0] = 0;
    char v41 = 0;
    sub_9B90();
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
    sub_9EA0();
    v40[0] = 0;
    char v41 = 0;
    sub_9B90();
    v34 = *(void (**)(char *, uint64_t))(v18 + 8);
    v34(v29, v17);
    return ((uint64_t (*)(char *, uint64_t))v34)(v31, v17);
  }
  return result;
}

uint64_t sub_6574(uint64_t a1)
{
  uint64_t v2 = sub_4218(&qword_106E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_65D4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_9BB0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ControlCenterSettingsView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ControlCenterSettingsView(id *a1)
{
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for ControlCenterSettingsView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  id v4 = v3;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ControlCenterSettingsView(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for ControlCenterSettingsView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ControlCenterSettingsView(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ControlCenterSettingsView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ControlCenterSettingsView(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ControlCenterSettingsView()
{
  return &type metadata for ControlCenterSettingsView;
}

uint64_t sub_6898()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_68B4()
{
  uint64_t v0 = sub_9EB0();
  sub_9514(v0, qword_106F8);
  uint64_t v1 = (void *)sub_94DC(v0, (uint64_t)qword_106F8);
  *uint64_t v1 = 0xD000000000000025;
  v1[1] = 0x800000000000B0E0;
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104);

  return v2();
}

uint64_t sub_6958()
{
  uint64_t v0 = sub_9AF0();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_9A70();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v4 = (unint64_t *)((char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_9EF0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_9A80();
  sub_9514(v6, qword_10710);
  sub_94DC(v6, (uint64_t)qword_10710);
  sub_9EE0();
  unint64_t *v4 = type metadata accessor for ControlCenterSettingsViewController();
  (*(void (**)(unint64_t *, void, uint64_t))(v2 + 104))(v4, enum case for LocalizedStringResource.BundleDescription.forClass(_:), v1);
  sub_9AE0();
  return sub_9A90();
}

uint64_t sub_6B48()
{
  uint64_t v0 = sub_4218(&qword_105D0);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_9AD0();
  sub_9514(v3, qword_10728);
  uint64_t v4 = sub_94DC(v3, (uint64_t)qword_10728);
  sub_9AC0();
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1, v3);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(v4, v2, v3);
  }
  __break(1u);
  return result;
}

uint64_t sub_6C78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v36 = a1;
  uint64_t v2 = sub_9A80();
  uint64_t v34 = *(void *)(v2 - 8);
  uint64_t v35 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_9EB0();
  uint64_t v5 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_4218(&qword_10740);
  uint64_t v31 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_4218(&qword_10748);
  uint64_t v32 = *(void *)(v11 - 8);
  uint64_t v33 = v11;
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_4218(&qword_10750);
  uint64_t v29 = *(void *)(v14 - 8);
  uint64_t v30 = v14;
  __chkstk_darwin(v14);
  uint64_t v28 = (char *)v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_9F50();
  v27[1] = sub_9F40();
  sub_9F30();
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
  }
  __chkstk_darwin(isCurrentExecutor);
  v27[-2] = v1;
  sub_4218(&qword_10758);
  sub_97E0(&qword_10760, &qword_10758);
  sub_9CB0();
  if (qword_10578 != -1) {
    swift_once();
  }
  uint64_t v17 = v37;
  uint64_t v18 = sub_94DC(v37, (uint64_t)qword_106F8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v18, v17);
  uint64_t v20 = v34;
  uint64_t v19 = v35;
  if (qword_10580 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_94DC(v19, (uint64_t)qword_10710);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v4, v21, v19);
  if (qword_10588 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_9AD0();
  sub_94DC(v22, (uint64_t)qword_10728);
  uint64_t v23 = sub_97E0(&qword_10768, &qword_10740);
  sub_9D20();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v4, v19);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v37);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v10, v8);
  uint64_t v38 = v8;
  uint64_t v39 = v23;
  swift_getOpaqueTypeConformance2();
  double v24 = v28;
  uint64_t v25 = v33;
  sub_9D10();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v13, v25);
  (*(void (**)(uint64_t, char *, uint64_t))(v29 + 32))(v36, v24, v30);
  return swift_release();
}

uint64_t sub_7238@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  v69 = a2;
  uint64_t v71 = sub_4218(&qword_10770);
  uint64_t v70 = *(void *)(v71 - 8);
  uint64_t v3 = __chkstk_darwin(v71);
  v77 = (char *)&v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v76 = (char *)&v63 - v5;
  uint64_t v6 = sub_4218(&qword_10778);
  uint64_t v68 = *(void *)(v6 - 8);
  uint64_t v7 = __chkstk_darwin(v6);
  v79 = (char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v78 = (char *)&v63 - v9;
  uint64_t v10 = sub_4218(&qword_10780);
  uint64_t v74 = *(void *)(v10 - 8);
  uint64_t v75 = v10;
  uint64_t v11 = __chkstk_darwin(v10);
  v73 = (char *)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v63 - v13;
  sub_9F50();
  uint64_t v67 = sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_4218(&qword_10788);
  sub_9578();
  uint64_t v15 = sub_9E80();
  v66 = &v63;
  __chkstk_darwin(v15);
  *(&v63 - 2) = a1;
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v72 = v14;
  if (qword_10570 != -1) {
    swift_once();
  }
  double v16 = (void *)qword_10AD0;
  NSString v17 = sub_9F00();
  id v18 = [v16 localizedStringForKey:v17 value:0 table:0];

  uint64_t v19 = sub_9F10();
  uint64_t v21 = v20;

  uint64_t v80 = v19;
  v81 = v21;
  unint64_t v22 = sub_9784();
  uint64_t v23 = sub_9D00();
  uint64_t v25 = v24;
  char v27 = v26;
  uint64_t v29 = v28;
  swift_release();
  uint64_t v80 = v23;
  v81 = v25;
  LOBYTE(v82) = v27 & 1;
  v83 = v29;
  sub_4218(&qword_10800);
  uint64_t v30 = sub_9494(&qword_10808);
  uint64_t v31 = sub_97E0(&qword_10810, &qword_10808);
  uint64_t v88 = v30;
  v89 = &type metadata for Bool;
  uint64_t v90 = v31;
  v91 = &protocol witness table for Bool;
  swift_getOpaqueTypeConformance2();
  uint64_t v32 = sub_9E90();
  __chkstk_darwin(v32);
  *(&v63 - 2) = a1;
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v33 = (void *)qword_10AD0;
  NSString v34 = sub_9F00();
  id v35 = [v33 localizedStringForKey:v34 value:0 table:0];

  uint64_t v36 = sub_9F10();
  uint64_t v38 = v37;

  uint64_t v80 = v36;
  v81 = v38;
  uint64_t v39 = sub_9D00();
  char v41 = v40;
  LOBYTE(v38) = v42;
  CGRect v44 = v43;
  swift_release();
  uint64_t v88 = v39;
  v89 = v41;
  LOBYTE(v90) = v38 & 1;
  v91 = v44;
  sub_4218(&qword_10818);
  uint64_t v45 = sub_9494(&qword_10820);
  uint64_t v46 = sub_97E0(&qword_10828, &qword_10820);
  uint64_t v80 = v45;
  v81 = &type metadata for String;
  uint64_t v82 = v45;
  v83 = &type metadata for Text;
  uint64_t v84 = v46;
  unint64_t v85 = v22;
  uint64_t v86 = v46;
  v87 = &protocol witness table for Text;
  swift_getOpaqueTypeConformance2();
  CGRect v47 = v76;
  sub_9E90();
  v64 = *(void (**)(char *, char *, uint64_t))(v74 + 16);
  v48 = v73;
  uint64_t v49 = v75;
  v64(v73, v72, v75);
  uint64_t v50 = v68;
  v66 = *(uint64_t **)(v68 + 16);
  uint64_t v51 = v6;
  ((void (*)(char *, char *, uint64_t))v66)(v79, v78, v6);
  uint64_t v52 = v70;
  v65 = *(void (**)(char *, char *, uint64_t))(v70 + 16);
  v53 = v47;
  uint64_t v54 = v71;
  v65(v77, v53, v71);
  v55 = v69;
  v64(v69, v48, v49);
  uint64_t v56 = sub_4218(&qword_10830);
  ((void (*)(char *, char *, uint64_t))v66)(&v55[*(int *)(v56 + 48)], v79, v51);
  v57 = v77;
  v65(&v55[*(int *)(v56 + 64)], v77, v54);
  v58 = *(void (**)(char *, uint64_t))(v52 + 8);
  v58(v76, v54);
  v59 = *(void (**)(char *, uint64_t))(v50 + 8);
  v59(v78, v51);
  uint64_t v60 = v75;
  v61 = *(void (**)(char *, uint64_t))(v74 + 8);
  v61(v72, v75);
  v58(v57, v54);
  v59(v79, v51);
  v61(v73, v60);
  return swift_release();
}

__n128 sub_7AD0@<Q0>(uint64_t a1@<X8>)
{
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_7C38((uint64_t)v19);
  uint64_t v2 = v19[1];
  uint64_t v18 = v19[0];
  char v3 = v20;
  uint64_t v4 = v21;
  uint64_t v5 = v22;
  char v6 = v23;
  long long v17 = v24;
  uint64_t v7 = v25;
  char v8 = v26;
  uint64_t v16 = v27;
  id v9 = [self systemGray5Color];
  sub_9DA0();
  uint64_t v10 = sub_9E70();
  swift_release();
  *(void *)a1 = v18;
  *(void *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  *(_OWORD *)(a1 + 48) = v17;
  *(void *)(a1 + 64) = v7;
  *(unsigned char *)(a1 + 72) = v8;
  *(void *)(a1 + 80) = v16;
  *(void *)(a1 + 88) = v10;
  __asm { FMOV            V0.2D, #14.0 }
  *(__n128 *)(a1 + 96) = result;
  *(__n128 *)(a1 + 112) = result;
  *(unsigned char *)(a1 + 128) = 0;
  return result;
}

uint64_t sub_7C38@<X0>(uint64_t a1@<X8>)
{
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v11 = sub_9BC0();
  sub_7D90((uint64_t)&v12);
  uint64_t v2 = v12;
  uint64_t v3 = v13;
  char v4 = v14;
  uint64_t v5 = v15;
  uint64_t v6 = v16;
  uint64_t v7 = v17;
  char v8 = v18;
  uint64_t v9 = v19;
  sub_9994(v12, v13, v14);
  swift_bridgeObjectRetain();
  sub_9994(v6, v7, v8);
  swift_bridgeObjectRetain();
  sub_9870(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_9870(v6, v7, v8);
  swift_release();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v11;
  *(void *)(a1 + 8) = 0x4018000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = v2;
  *(void *)(a1 + 32) = v3;
  *(unsigned char *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = v5;
  *(void *)(a1 + 56) = v6;
  *(void *)(a1 + 64) = v7;
  *(unsigned char *)(a1 + 72) = v8;
  *(void *)(a1 + 80) = v9;
  return result;
}

id sub_7D90@<X0>(uint64_t a1@<X8>)
{
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (qword_10570 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)qword_10AD0;
  NSString v2 = sub_9F00();
  id v3 = [v1 localizedStringForKey:v2 value:0 table:0];

  sub_9F10();
  sub_9784();
  uint64_t v4 = sub_9D00();
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  sub_9CA0();
  uint64_t v9 = sub_9CF0();
  uint64_t v11 = v10;
  char v13 = v12;
  swift_release();
  sub_9870(v4, v6, v8);
  swift_bridgeObjectRelease();
  uint64_t v14 = sub_9CE0();
  uint64_t v16 = v15;
  char v18 = v17;
  uint64_t v20 = v19;
  sub_9870(v9, v11, v13 & 1);
  swift_bridgeObjectRelease();
  id result = [self standardDefaults];
  if (result)
  {
    uint64_t v22 = result;
    [result presentationGesture];

    char v23 = (void *)qword_10AD0;
    uint64_t v42 = v14;
    uint64_t v43 = v20;
    uint64_t v41 = v16;
    NSString v24 = sub_9F00();
    id v25 = [v23 localizedStringForKey:v24 value:0 table:0];

    sub_9F10();
    uint64_t v26 = sub_9D00();
    uint64_t v28 = v27;
    LOBYTE(v24) = v29 & 1;
    sub_9CA0();
    uint64_t v30 = sub_9CF0();
    uint64_t v32 = v31;
    char v34 = v33;
    swift_release();
    sub_9870(v26, v28, (char)v24);
    swift_bridgeObjectRelease();
    sub_9D90();
    uint64_t v35 = sub_9CC0();
    uint64_t v37 = v36;
    LOBYTE(v24) = v38;
    uint64_t v40 = v39;
    swift_release();
    sub_9870(v30, v32, v34 & 1);
    swift_bridgeObjectRelease();
    *(void *)a1 = v42;
    *(void *)(a1 + 8) = v41;
    *(unsigned char *)(a1 + 16) = v18 & 1;
    *(void *)(a1 + 24) = v43;
    *(void *)(a1 + 32) = v35;
    *(void *)(a1 + 40) = v37;
    *(unsigned char *)(a1 + 48) = v24 & 1;
    *(void *)(a1 + 56) = v40;
    sub_9994(v42, v41, v18 & 1);
    swift_bridgeObjectRetain();
    sub_9994(v35, v37, v24 & 1);
    swift_bridgeObjectRetain();
    sub_9870(v35, v37, v24 & 1);
    swift_bridgeObjectRelease();
    sub_9870(v42, v41, v18 & 1);
    swift_release();
    return (id)swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_81AC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  char v23 = a2;
  uint64_t v3 = sub_4218(&qword_10808);
  uint64_t v21 = *(void *)(v3 - 8);
  uint64_t v22 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_4218(&qword_10800);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  char v12 = (char *)&v20 - v11;
  sub_9F50();
  uint64_t v20 = sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  long long v26 = *(_OWORD *)(a1 + 8);
  long long v24 = *(_OWORD *)(a1 + 8);
  sub_4218(&qword_10838);
  sub_9DE0();
  swift_release();
  sub_9E60();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  long long v25 = v26;
  sub_9DC0();
  swift_release();
  char v13 = *(void **)a1;
  long long v25 = *(_OWORD *)(a1 + 24);
  uint64_t v14 = swift_allocObject();
  long long v15 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v14 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v14 + 32) = v15;
  *(void *)(v14 + 48) = *(void *)(a1 + 32);
  id v16 = v13;
  sub_9830((uint64_t)&v26);
  sub_9830((uint64_t)&v25);
  sub_97E0(&qword_10810, &qword_10808);
  uint64_t v17 = v22;
  sub_9D70();
  swift_release();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v5, v17);
  char v18 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v18(v12, v10, v6);
  v18(v23, v12, v6);
  return swift_release();
}

uint64_t sub_85B8@<X0>(uint64_t a1@<X8>)
{
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (qword_10570 != -1) {
    swift_once();
  }
  NSString v2 = (void *)qword_10AD0;
  NSString v3 = sub_9F00();
  id v4 = [v2 localizedStringForKey:v3 value:0 table:0];

  sub_9F10();
  sub_9784();
  uint64_t v5 = sub_9D00();
  uint64_t v7 = v6;
  char v9 = v8;
  uint64_t v11 = v10;
  uint64_t result = swift_release();
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v9 & 1;
  *(void *)(a1 + 24) = v11;
  return result;
}

uint64_t sub_8724(uint64_t a1, unsigned __int8 *a2, id *a3)
{
  uint64_t v4 = *a2;
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  [*a3 didSetAccessWithinApps:v4];

  return swift_release();
}

uint64_t sub_87D8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v3 = sub_4218(&qword_10820);
  uint64_t v30 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_4218(&qword_10818);
  uint64_t v6 = *(void *)(v29 - 8);
  uint64_t v7 = __chkstk_darwin(v29);
  uint64_t v28 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v27 - v9;
  sub_9F50();
  v27[1] = sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v11 = *(void **)a1;
  long long v12 = *(_OWORD *)(a1 + 8);
  long long v35 = *(_OWORD *)(a1 + 24);
  long long v36 = v12;
  uint64_t v13 = swift_allocObject();
  long long v14 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v13 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v13 + 32) = v14;
  *(void *)(v13 + 48) = *(void *)(a1 + 32);
  id v15 = v11;
  sub_9830((uint64_t)&v36);
  sub_9830((uint64_t)&v35);
  sub_9DF0();
  if (qword_10570 != -1) {
    swift_once();
  }
  id v16 = (void *)qword_10AD0;
  NSString v17 = sub_9F00();
  id v18 = [v16 localizedStringForKey:v17 value:0 table:0];

  uint64_t v19 = sub_9F10();
  uint64_t v21 = v20;

  uint64_t v33 = v19;
  uint64_t v34 = v21;
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  long long v32 = v35;
  sub_4218(&qword_10838);
  sub_9DE0();
  uint64_t v22 = swift_release();
  __chkstk_darwin(v22);
  sub_97E0(&qword_10828, &qword_10820);
  sub_9784();
  char v23 = v28;
  sub_9D60();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v5, v3);
  long long v24 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  uint64_t v25 = v29;
  v24(v10, v23, v29);
  v24(v31, v10, v25);
  return swift_release();
}

uint64_t sub_8C94(uint64_t a1)
{
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  long long v3 = *(_OWORD *)(a1 + 24);
  sub_9880((uint64_t)&v3 + 8, (uint64_t)v4);
  sub_98E8((uint64_t)v4);
  sub_4218(&qword_10838);
  sub_9DC0();
  sub_9DD0();
  sub_9914((uint64_t)&v3);
  swift_release();
  return swift_release();
}

uint64_t sub_8E00@<X0>(uint64_t a1@<X8>)
{
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (qword_10570 != -1) {
    swift_once();
  }
  NSString v2 = (void *)qword_10AD0;
  NSString v3 = sub_9F00();
  id v4 = [v2 localizedStringForKey:v3 value:0 table:0];

  sub_9F10();
  sub_9784();
  uint64_t v5 = sub_9D00();
  uint64_t v7 = v6;
  char v9 = v8 & 1;
  sub_9D80();
  uint64_t v10 = sub_9CD0();
  uint64_t v12 = v11;
  char v14 = v13;
  uint64_t v16 = v15;
  sub_9870(v5, v7, v9);
  swift_release();
  swift_release();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v10;
  *(void *)(a1 + 8) = v12;
  *(unsigned char *)(a1 + 16) = v14 & 1;
  *(void *)(a1 + 24) = v16;
  return result;
}

uint64_t sub_8FE4(uint64_t a1)
{
  uint64_t v2 = sub_4218(&qword_10840);
  __chkstk_darwin(v2 - 8);
  id v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (qword_10570 != -1) {
    swift_once();
  }
  uint64_t v5 = (void *)qword_10AD0;
  NSString v6 = sub_9F00();
  id v7 = [v5 localizedStringForKey:v6 value:0 table:0];

  uint64_t v8 = sub_9F10();
  uint64_t v10 = v9;

  v18[0] = v8;
  v18[1] = v10;
  sub_9B60();
  uint64_t v11 = sub_9B70();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v4, 0, 1, v11);
  uint64_t v12 = *(void **)a1;
  long long v13 = *(_OWORD *)(a1 + 8);
  long long v19 = *(_OWORD *)(a1 + 24);
  long long v20 = v13;
  uint64_t v14 = swift_allocObject();
  long long v15 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v14 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v14 + 32) = v15;
  *(void *)(v14 + 48) = *(void *)(a1 + 32);
  id v16 = v12;
  sub_9830((uint64_t)&v20);
  sub_9830((uint64_t)&v19);
  sub_9784();
  sub_9E00();
  return swift_release();
}

uint64_t sub_9238(id *a1)
{
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  [*a1 resetToDefaultLayout];

  return swift_release();
}

uint64_t sub_92DC@<X0>(uint64_t a1@<X8>)
{
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (qword_10570 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_10AD0;
  NSString v3 = sub_9F00();
  id v4 = [v2 localizedStringForKey:v3 value:0 table:0];

  sub_9F10();
  sub_9784();
  uint64_t v5 = sub_9D00();
  uint64_t v7 = v6;
  char v9 = v8;
  uint64_t v11 = v10;
  uint64_t result = swift_release();
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v9 & 1;
  *(void *)(a1 + 24) = v11;
  return result;
}

uint64_t sub_9450@<X0>(uint64_t a1@<X8>)
{
  return sub_6C78(a1);
}

uint64_t sub_948C@<X0>(char *a1@<X8>)
{
  return sub_7238(*(void *)(v1 + 16), a1);
}

uint64_t sub_9494(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_94DC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_9514(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_9578()
{
  unint64_t result = qword_10790;
  if (!qword_10790)
  {
    sub_9494(&qword_10788);
    sub_9618();
    sub_97E0(&qword_107E8, &qword_107F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10790);
  }
  return result;
}

unint64_t sub_9618()
{
  unint64_t result = qword_10798;
  if (!qword_10798)
  {
    sub_9494(&qword_107A0);
    sub_96B8();
    sub_97E0(&qword_107D8, &qword_107E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10798);
  }
  return result;
}

unint64_t sub_96B8()
{
  unint64_t result = qword_107A8;
  if (!qword_107A8)
  {
    sub_9494(&qword_107B0);
    sub_97E0(&qword_107B8, &qword_107C0);
    sub_97E0(&qword_107C8, &qword_107D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_107A8);
  }
  return result;
}

uint64_t sub_977C@<X0>(char *a1@<X8>)
{
  return sub_81AC(*(void *)(v1 + 16), a1);
}

unint64_t sub_9784()
{
  unint64_t result = qword_107F8;
  if (!qword_107F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_107F8);
  }
  return result;
}

uint64_t sub_97D8@<X0>(char *a1@<X8>)
{
  return sub_87D8(*(void *)(v1 + 16), a1);
}

uint64_t sub_97E0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_9494(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_9828()
{
  return sub_8C94(v0 + 16);
}

uint64_t sub_9830(uint64_t a1)
{
  return a1;
}

uint64_t sub_985C()
{
  return sub_8FE4(*(void *)(v0 + 16));
}

uint64_t sub_9868()
{
  return sub_9238((id *)(v0 + 16));
}

uint64_t sub_9870(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_9880(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4218(&qword_10848);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_98E8(uint64_t a1)
{
  return a1;
}

uint64_t sub_9914(uint64_t a1)
{
  return a1;
}

uint64_t sub_9944()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_998C(uint64_t a1, unsigned __int8 *a2)
{
  return sub_8724(a1, a2, (id *)(v2 + 16));
}

uint64_t sub_9994(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_99A4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_9A60()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_9A70()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_9A80()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_9A90()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

void sub_9AA0(NSURL *retstr@<X8>)
{
}

uint64_t sub_9AB0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_9AC0()
{
  return URL.init(string:)();
}

uint64_t sub_9AD0()
{
  return type metadata accessor for URL();
}

uint64_t sub_9AE0()
{
  return static Locale.current.getter();
}

uint64_t sub_9AF0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_9B00()
{
  return Logger.logObject.getter();
}

uint64_t sub_9B10()
{
  return Logger.init()();
}

uint64_t sub_9B20()
{
  return type metadata accessor for Logger();
}

uint64_t sub_9B30()
{
  return type metadata accessor for UITraitUserInterfaceStyle();
}

uint64_t sub_9B40()
{
  return Animatable<>.animatableData.modify();
}

uint64_t sub_9B50()
{
  return static Animatable<>._makeAnimatable(value:inputs:)();
}

uint64_t sub_9B60()
{
  return static ButtonRole.destructive.getter();
}

uint64_t sub_9B70()
{
  return type metadata accessor for ButtonRole();
}

uint64_t sub_9B80()
{
  return LayoutSubview.sizeThatFits(_:)();
}

uint64_t sub_9B90()
{
  return LayoutSubview.place(at:anchor:proposal:)();
}

uint64_t sub_9BA0()
{
  return type metadata accessor for LayoutSubview();
}

uint64_t sub_9BB0()
{
  return type metadata accessor for LayoutSubviews();
}

uint64_t sub_9BC0()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_9BD0()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_9BE0()
{
  return UIViewRepresentable._resetUIView(_:coordinator:destroy:)();
}

uint64_t sub_9BF0()
{
  return static UIViewRepresentable.dismantleUIView(_:coordinator:)();
}

uint64_t sub_9C00()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t sub_9C20()
{
  return static UIViewRepresentable._layoutOptions(_:)();
}

uint64_t sub_9C30()
{
  return UIViewRepresentable._identifiedViewTree(in:)();
}

uint64_t sub_9C40()
{
  return UIViewRepresentable._overrideLayoutTraits(_:for:)();
}

uint64_t sub_9C50()
{
  return UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)();
}

uint64_t sub_9C60()
{
  return static UIViewRepresentable._modifyBridgedViewInputs(_:)();
}

uint64_t sub_9C70()
{
  return UIViewRepresentable.body.getter();
}

uint64_t sub_9C90()
{
  return UIViewRepresentable<>.makeCoordinator()();
}

uint64_t sub_9CA0()
{
  return static Font.subheadline.getter();
}

uint64_t sub_9CB0()
{
  return List<>.init(content:)();
}

uint64_t sub_9CC0()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_9CD0()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_9CE0()
{
  return Text.bold()();
}

uint64_t sub_9CF0()
{
  return Text.font(_:)();
}

uint64_t sub_9D00()
{
  return Text.init<A>(_:)();
}

uint64_t sub_9D10()
{
  return View.settingsListAppearance()();
}

uint64_t sub_9D20()
{
  return View.emitNavigationEventOnAppearForSystemSetting(icon:title:localizedNavigationComponents:deepLink:)();
}

uint64_t sub_9D30()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_9D40()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_9D50()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_9D60()
{
  return View.confirmationDialog<A, B, C>(_:isPresented:titleVisibility:actions:message:)();
}

uint64_t sub_9D70()
{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t sub_9D80()
{
  return static Color.blue.getter();
}

uint64_t sub_9D90()
{
  return static Color.secondary.getter();
}

uint64_t sub_9DA0()
{
  return Color.init(_:)();
}

uint64_t sub_9DB0()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_9DC0()
{
  return State.wrappedValue.getter();
}

uint64_t sub_9DD0()
{
  return State.wrappedValue.setter();
}

uint64_t sub_9DE0()
{
  return State.projectedValue.getter();
}

uint64_t sub_9DF0()
{
  return Button.init(action:label:)();
}

uint64_t sub_9E00()
{
  return Button<>.init<A>(_:role:action:)();
}

uint64_t sub_9E10()
{
  return static Layout._makeLayoutView(root:inputs:body:)();
}

uint64_t sub_9E20()
{
  return Layout.updateCache(_:subviews:)();
}

uint64_t sub_9E30()
{
  return static Layout.layoutProperties.getter();
}

uint64_t sub_9E40()
{
  return Layout.spacing(subviews:cache:)();
}

uint64_t sub_9E50()
{
  return Layout<>.makeCache(subviews:)();
}

uint64_t sub_9E60()
{
  return Toggle.init(isOn:label:)();
}

uint64_t sub_9E70()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_9E80()
{
  return Section<>.init(content:)();
}

uint64_t sub_9E90()
{
  return Section<>.init(footer:content:)();
}

uint64_t sub_9EA0()
{
  return static UnitPoint.topLeading.getter();
}

uint64_t sub_9EB0()
{
  return type metadata accessor for SettingsEventImage();
}

NSDictionary sub_9EC0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_9ED0()
{
  return dispatch thunk of BidirectionalCollection.index(before:)();
}

uint64_t sub_9EE0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_9EF0()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_9F00()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_9F10()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

void sub_9F20(Swift::String a1)
{
}

uint64_t sub_9F30()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_9F40()
{
  return static MainActor.shared.getter();
}

uint64_t sub_9F50()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_9F60()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t sub_9F70()
{
  return dispatch thunk of Collection.isEmpty.getter();
}

uint64_t sub_9F80()
{
  return dispatch thunk of Collection.distance(from:to:)();
}

uint64_t sub_9F90()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t sub_9FA0()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t sub_9FB0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_9FC0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_9FD0()
{
  return UIView.registerForTraitChanges<A>(_:handler:)();
}

uint64_t sub_9FE0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_9FF0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DMakeScale(retstr, sx, sy, sz);
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

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_task_isCurrentExecutor()
{
  return _swift_task_isCurrentExecutor();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return _swift_task_reportUnexpectedExecutor();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_objectForInfoDictionaryKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForInfoDictionaryKey:");
}