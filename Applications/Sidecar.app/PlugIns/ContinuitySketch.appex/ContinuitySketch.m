id sub_100004634()
{
  id v0;
  NSString v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = sub_1000069F0();
  swift_bridgeObjectRelease();
  v2 = [v0 initWithTitle:v1];

  return v2;
}

uint64_t sub_1000046A8(uint64_t a1)
{
  return sub_1000061D0(a1, OBJC_IVAR___SketchViewController_cancelButton);
}

uint64_t sub_1000046B4(uint64_t a1)
{
  return sub_1000061D0(a1, OBJC_IVAR___SketchViewController_doneButton);
}

uint64_t sub_1000046C0(uint64_t a1)
{
  return sub_1000061D0(a1, OBJC_IVAR___SketchViewController_picker);
}

id sub_100004718()
{
  return *(id *)(v0 + OBJC_IVAR___SketchViewController__navigationItem);
}

uint64_t sub_100004728(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR___SketchViewController_observer) = a1;
  return swift_release();
}

void sub_100004740()
{
  sub_100006A60();
  sub_1000061B0();
  uint64_t v3 = v2;
  __chkstk_darwin(v4, v5);
  v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for SketchViewController();
  v51.receiver = v1;
  v51.super_class = v8;
  [super viewDidLoad];
  id v9 = [v1 view];
  if (v9)
  {
    v10 = v9;
    v11 = *(void **)&v1[OBJC_IVAR___SketchViewController__navigationItem];
    sub_100005F60(v1);
    uint64_t v47 = v3;
    uint64_t v48 = v0;
    if (v12)
    {
      NSString v13 = sub_1000069F0();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v13 = 0;
    }
    [v11 setTitle:v13];

    *((void *)&v50 + 1) = v8;
    *(void *)&long long v49 = v1;
    id v14 = objc_allocWithZone((Class)UIBarButtonItem);
    v15 = v1;
    id v16 = sub_100005CAC(1, &v49, (uint64_t)"cancel:");
    id v17 = v16;
    sub_1000046A8((uint64_t)v16);
    *((void *)&v50 + 1) = v8;
    *(void *)&long long v49 = v15;
    id v18 = objc_allocWithZone((Class)UIBarButtonItem);
    v19 = v15;
    id v20 = sub_100005CAC(0, &v49, (uint64_t)"done:");
    id v21 = v20;
    sub_1000046B4((uint64_t)v20);
    long long v49 = 0u;
    long long v50 = 0u;
    id v22 = objc_allocWithZone((Class)UIBarButtonItem);
    id v46 = sub_100005CAC(6, &v49, 0);
    [v46 setWidth:40.0];
    sub_100005F1C(&qword_10000CD08);
    uint64_t v23 = swift_allocObject();
    long long v44 = xmmword_100006F20;
    *(_OWORD *)(v23 + 16) = xmmword_100006F20;
    *(void *)(v23 + 32) = v17;
    *(void *)&long long v49 = v23;
    sub_100006A30();
    uint64_t v24 = v49;
    id v45 = v17;
    sub_100005FC4(v24, v11, (SEL *)&selRef_setLeftBarButtonItems_);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = v44;
    *(void *)(v25 + 32) = v21;
    *(void *)&long long v49 = v25;
    sub_100006A30();
    uint64_t v26 = v49;
    *(void *)&long long v44 = v21;
    sub_100005FC4(v26, v11, (SEL *)&selRef_setRightBarButtonItems_);
    v27 = *(void **)&v19[OBJC_IVAR___SketchViewController_canvas];
    [v27 setDelegate:v19];
    [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v10 addSubview:v27];
    v28 = self;
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_100006F30;
    id v30 = [v27 leftAnchor];
    id v31 = [v10 leftAnchor];
    id v32 = [v30 constraintEqualToAnchor:v31];

    *(void *)(v29 + 32) = v32;
    id v33 = [v27 topAnchor];
    id v34 = sub_1000061DC((uint64_t)[v10 topAnchor]);

    *(void *)(v29 + 40) = v34;
    id v35 = [v10 rightAnchor];
    id v36 = sub_1000061DC((uint64_t)[v27 rightAnchor]);

    *(void *)(v29 + 48) = v36;
    id v37 = [v10 bottomAnchor];
    id v38 = [v27 bottomAnchor];
    id v39 = [v37 constraintEqualToAnchor:v38];

    *(void *)(v29 + 56) = v39;
    *(void *)&long long v49 = v29;
    sub_100006A30();
    sub_1000060E0(0, (unint64_t *)&qword_10000CD10);
    Class isa = sub_100006A20().super.isa;
    swift_bridgeObjectRelease();
    [v28 activateConstraints:isa];

    id v41 = [self defaultCenter];
    sub_100006A70();

    swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_100006090();
    uint64_t v42 = v48;
    uint64_t v43 = sub_1000069B0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v47 + 8))(v7, v42);
    sub_100004728(v43);
    [v10 layoutIfNeeded];
  }
  else
  {
    __break(1u);
  }
}

void sub_100004D00()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_100004D9C();
  }
}

void sub_100004D9C()
{
  if (!*(void *)(v0 + OBJC_IVAR___SketchViewController_picker))
  {
    uint64_t v1 = v0;
    id v2 = [objc_allocWithZone((Class)PKToolPicker) init];
    uint64_t v3 = *(void **)(v1 + OBJC_IVAR___SketchViewController_canvas);
    [v2 addObserver:v3];
    [v2 setVisible:1 forFirstResponder:v3];
    id v4 = v2;
    sub_1000046C0((uint64_t)v2);
    [v3 becomeFirstResponder];
    if (*(void *)(v1 + OBJC_IVAR___SketchViewController_observer))
    {
      swift_retain();
      sub_1000069A0();
      swift_release();
    }
    sub_100004728(0);
  }
}

void sub_100004EF0()
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = Strong;
    [Strong completeRequest:1];
  }
}

void sub_100004F6C()
{
  sub_1000069E0();
  sub_1000061B0();
  uint64_t v3 = v2;
  __chkstk_darwin(v4, v5);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v9 = Strong;
    id v10 = [Strong request];
    if (v10)
    {
      v11 = v10;
      uint64_t v12 = *(void **)(v1 + OBJC_IVAR___SketchViewController_canvas);
      id v13 = sub_100005A84(v12);
      sub_1000069D0();

      v33.origin.double x = sub_100005ACC(v12);
      double x = v33.origin.x;
      double y = v33.origin.y;
      double width = v33.size.width;
      double height = v33.size.height;
      if (CGRectIsEmpty(v33))
      {
        [v11 cancel];
      }
      else
      {
        id v20 = sub_100005B38(v12);
        uint64_t v21 = sub_100006960();
        unint64_t v23 = v22;

        id v30 = [objc_allocWithZone((Class)PKImageRenderer) initWithSize:width scale:height];
        Class isa = sub_1000069C0().super.isa;
        uint64_t v25 = (void *)swift_allocObject();
        v25[2] = v21;
        v25[3] = v23;
        v25[4] = v11;
        aBlock[4] = sub_100005C30;
        aBlock[5] = v25;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_100005534;
        aBlock[3] = &unk_100008408;
        uint64_t v26 = _Block_copy(aBlock);
        sub_100005C54(v21, v23);
        id v27 = v11;
        swift_release();
        id v28 = v30;
        [v30 renderDrawing:isa clippedToStrokeSpaceRect:v26 scale:x y:y width:width height:height completion:1.0];
        _Block_release(v26);

        sub_100005BD8(v21, v23);
      }
      (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v0);
      return;
    }
  }
  id v18 = (void *)swift_unknownObjectWeakLoadStrong();
  if (v18)
  {
    id v30 = v18;
    [v18 completeRequest:0];
    id v19 = v30;
  }
}

void sub_100005270(void *a1, uint64_t a2, unint64_t a3, void *a4)
{
  uint64_t v8 = sub_100006990();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v24 = (unint64_t)&_swiftEmptyArrayStorage;
  if (a1)
  {
    id v13 = a1;
    id v14 = UIImagePNGRepresentation(v13);
    if (v14)
    {
      v15 = v14;
      unint64_t v23 = a4;
      uint64_t v16 = sub_100006960();
      unint64_t v18 = v17;

      sub_100005C54(v16, v18);
      sub_100006980();
      sub_100006970();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
      id v19 = objc_allocWithZone((Class)SidecarItem);
      id v20 = sub_100005E04(v16, v18);
      sub_100006A10();
      if (*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_100006A40();
      }
      sub_100006A50();
      sub_100006A30();

      sub_100005BD8(v16, v18);
      a4 = v23;
    }
    else
    {
    }
  }
  sub_100006A00();
  objc_allocWithZone((Class)SidecarItem);
  sub_100005C54(a2, a3);
  id v21 = sub_100005E04(a2, a3);
  sub_100006A10();
  if (*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_100006A40();
  }
  sub_100006A50();
  sub_100006A30();
  sub_1000060E0(0, &qword_10000CCF0);
  Class isa = sub_100006A20().super.isa;
  swift_bridgeObjectRelease();
  [a4 sendItems:isa];
}

void sub_100005534(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_1000055B8(void *a1, uint64_t a2, uint64_t a3, void (*a4)(id))
{
  if (a3)
  {
    id v6 = a1;
    swift_unknownObjectRetain();
    sub_100006A80();
    id v7 = (id)swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    id v7 = a1;
  }
  a4(v7);

  return sub_100005EBC((uint64_t)v9);
}

id sub_100005634(uint64_t a1, uint64_t a2, void *a3)
{
  swift_unknownObjectWeakInit();
  uint64_t v6 = OBJC_IVAR___SketchViewController__undoManager;
  id v7 = objc_allocWithZone((Class)NSUndoManager);
  uint64_t v8 = v3;
  *(void *)&v3[v6] = [v7 init];
  uint64_t v9 = OBJC_IVAR___SketchViewController__navigationItem;
  sub_1000060E0(0, &qword_10000CCF8);
  *(void *)&v8[v9] = sub_100004634();
  *(void *)&v8[OBJC_IVAR___SketchViewController_cancelButton] = 0;
  *(void *)&v8[OBJC_IVAR___SketchViewController_doneButton] = 0;
  *(void *)&v8[OBJC_IVAR___SketchViewController_fixedSpace] = 0;
  uint64_t v10 = OBJC_IVAR___SketchViewController_canvas;
  *(void *)&v8[v10] = [objc_allocWithZone((Class)PKCanvasView) init];
  *(void *)&v8[OBJC_IVAR___SketchViewController_picker] = 0;
  *(void *)&v8[OBJC_IVAR___SketchViewController_observer] = 0;

  if (a2)
  {
    NSString v11 = sub_1000069F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v11 = 0;
  }
  v14.receiver = v8;
  v14.super_class = (Class)type metadata accessor for SketchViewController();
  id v12 = [super initWithNibName:v11 bundle:a3];

  return v12;
}

id sub_10000580C(void *a1)
{
  swift_unknownObjectWeakInit();
  uint64_t v3 = OBJC_IVAR___SketchViewController__undoManager;
  id v4 = objc_allocWithZone((Class)NSUndoManager);
  uint64_t v5 = v1;
  *(void *)&v1[v3] = [v4 init];
  uint64_t v6 = OBJC_IVAR___SketchViewController__navigationItem;
  sub_1000060E0(0, &qword_10000CCF8);
  *(void *)&v5[v6] = sub_100004634();
  *(void *)&v5[OBJC_IVAR___SketchViewController_cancelButton] = 0;
  *(void *)&v5[OBJC_IVAR___SketchViewController_doneButton] = 0;
  *(void *)&v5[OBJC_IVAR___SketchViewController_fixedSpace] = 0;
  uint64_t v7 = OBJC_IVAR___SketchViewController_canvas;
  *(void *)&v5[v7] = [objc_allocWithZone((Class)PKCanvasView) init];
  *(void *)&v5[OBJC_IVAR___SketchViewController_picker] = 0;
  *(void *)&v5[OBJC_IVAR___SketchViewController_observer] = 0;

  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for SketchViewController();
  [super initWithCoder:a1];

  return v8;
}

id sub_100005970()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SketchViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for SketchViewController()
{
  return self;
}

id sub_100005A84(void *a1)
{
  id v1 = a1;
  objc_super v2 = [v1 drawing];

  return v2;
}

double sub_100005ACC(void *a1)
{
  id v1 = a1;
  objc_super v2 = [v1 drawing];
  [v2 bounds];
  double v4 = v3;

  return v4;
}

id sub_100005B38(void *a1)
{
  id v1 = a1;
  objc_super v2 = [v1 drawing];
  double v3 = [v2 dataRepresentation];

  return v3;
}

uint64_t sub_100005B98()
{
  sub_100005BD8(*(void *)(v0 + 16), *(void *)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100005BD8(uint64_t a1, unint64_t a2)
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

void sub_100005C30(void *a1)
{
  sub_100005270(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_100005C3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100005C4C()
{
  return swift_release();
}

uint64_t sub_100005C54(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

id sub_100005CAC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[3];
  if (v6)
  {
    id v8 = sub_10000611C(a2, a2[3]);
    uint64_t v9 = *(void *)(v6 - 8);
    __chkstk_darwin(v8, v8);
    NSString v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    uint64_t v12 = sub_100006A90();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v6);
    sub_100006160((uint64_t)a2);
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = [v3 initWithBarButtonSystemItem:a1 target:v12 action:a3];
  swift_unknownObjectRelease();
  return v13;
}

id sub_100005E04(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = sub_100006950().super.isa;
    sub_100005EA8(a1, a2);
  }
  NSString v6 = sub_1000069F0();
  swift_bridgeObjectRelease();
  id v7 = [v2 initWithData:isa type:v6];

  return v7;
}

uint64_t sub_100005EA8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100005BD8(a1, a2);
  }
  return a1;
}

uint64_t sub_100005EBC(uint64_t a1)
{
  uint64_t v2 = sub_100005F1C(&qword_10000CD00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100005F1C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005F60(void *a1)
{
  id v1 = [a1 title];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_100006A00();

  return v3;
}

void sub_100005FC4(uint64_t a1, void *a2, SEL *a3)
{
  sub_1000060E0(0, (unint64_t *)&unk_10000CD20);
  Class isa = sub_100006A20().super.isa;
  swift_bridgeObjectRelease();
  [a2 *a3];
}

uint64_t sub_100006050()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100006088()
{
}

unint64_t sub_100006090()
{
  unint64_t result = qword_10000CD18;
  if (!qword_10000CD18)
  {
    sub_100006A60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CD18);
  }
  return result;
}

uint64_t sub_1000060E0(uint64_t a1, unint64_t *a2)
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

void *sub_10000611C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100006160(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000061D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 + a2) = a1;
  return _objc_release_x1();
}

id sub_1000061DC(uint64_t a1)
{
  double v4 = *(const char **)(v1 + 2264);
  return [v2 v4:a1];
}

void sub_100006204()
{
  uint64_t v1 = v0;
  v24.receiver = v0;
  v24.super_class = (Class)type metadata accessor for SketchRootController();
  [super viewDidLoad];
  id v2 = [v0 view];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = [self systemBackgroundColor];
    [v3 setBackgroundColor:v4];

    uint64_t v5 = *(void **)&v1[OBJC_IVAR___SketchRootController__navigationController];
    id v6 = [v5 view];
    if (v6)
    {
      id v7 = v6;
      [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v1 addChildViewController:v5];
      [v3 addSubview:v7];
      id v8 = self;
      sub_100005F1C(&qword_10000CD08);
      uint64_t v9 = swift_allocObject();
      *(_OWORD *)(v9 + 16) = xmmword_100006F30;
      id v10 = [v7 leftAnchor];
      id v11 = [v3 leftAnchor];
      id v12 = sub_100006914();

      *(void *)(v9 + 32) = v12;
      id v13 = [v7 rightAnchor];
      id v14 = [v3 rightAnchor];
      id v15 = sub_100006914();

      *(void *)(v9 + 40) = v15;
      id v16 = [v7 topAnchor];
      id v17 = [v3 topAnchor];
      id v18 = sub_100006914();

      *(void *)(v9 + 48) = v18;
      id v19 = [v7 bottomAnchor];
      id v20 = [v3 bottomAnchor];
      id v21 = sub_100006914();

      *(void *)(v9 + 56) = v21;
      sub_100006A30();
      sub_1000068D4();
      Class isa = sub_100006A20().super.isa;
      swift_bridgeObjectRelease();
      [v8 activateConstraints:isa];

      uint64_t v23 = *(void *)&v1[OBJC_IVAR___SketchRootController_sketchController];
      swift_unknownObjectWeakAssign();
      [v5 pushViewController:v23 animated:0];
      [v5 didMoveToParentViewController:v1];

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id sub_100006594(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = OBJC_IVAR___SketchRootController__navigationController;
  id v8 = objc_allocWithZone((Class)UINavigationController);
  uint64_t v9 = v3;
  *(void *)&v3[v7] = sub_100006930();
  uint64_t v10 = OBJC_IVAR___SketchRootController_sketchController;
  type metadata accessor for SketchViewController();
  *(void *)&v4[v10] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];

  if (a2)
  {
    NSString v11 = sub_1000069F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v11 = 0;
  }
  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for SketchRootController();
  [super initWithNibName:v11 bundle:a3];

  return v12;
}

id sub_1000066E4(void *a1)
{
  uint64_t v4 = OBJC_IVAR___SketchRootController__navigationController;
  id v5 = objc_allocWithZone((Class)UINavigationController);
  id v6 = v1;
  *(void *)&v1[v4] = sub_100006930();
  uint64_t v7 = OBJC_IVAR___SketchRootController_sketchController;
  type metadata accessor for SketchViewController();
  *(void *)&v2[v7] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];

  v10.receiver = v2;
  v10.super_class = (Class)type metadata accessor for SketchRootController();
  [super initWithCoder:a1];

  return v8;
}

id sub_1000067C0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SketchRootController();
  return [super dealloc];
}

uint64_t type metadata accessor for SketchRootController()
{
  return self;
}

id sub_100006864(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = sub_1000069F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  id v6 = [v3 initWithNibName:v5 bundle:a3];

  return v6;
}

unint64_t sub_1000068D4()
{
  unint64_t result = qword_10000CD10;
  if (!qword_10000CD10)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10000CD10);
  }
  return result;
}

id sub_100006914()
{
  uint64_t v4 = *(const char **)(v2 + 2264);
  return [v0 v4:v1];
}

id sub_100006930()
{
  return sub_100006864(0, 0, 0);
}

NSData sub_100006950()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100006960()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006970()
{
  return UTType.identifier.getter();
}

uint64_t sub_100006980()
{
  return static UTType.png.getter();
}

uint64_t sub_100006990()
{
  return type metadata accessor for UTType();
}

void sub_1000069A0()
{
}

uint64_t sub_1000069B0()
{
  return Publisher<>.sink(receiveValue:)();
}

PKDrawing sub_1000069C0()
{
  return PKDrawing._bridgeToObjectiveC()();
}

uint64_t sub_1000069D0()
{
  return static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000069E0()
{
  return type metadata accessor for PKDrawing();
}

NSString sub_1000069F0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100006A00()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006A10()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100006A20()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100006A30()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100006A40()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100006A50()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100006A60()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t sub_100006A70()
{
  return NSNotificationCenter.publisher(for:object:)();
}

uint64_t sub_100006A80()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100006A90()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
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

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_dataRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dataRepresentation];
}

id objc_msgSend_drawing(void *a1, const char *a2, ...)
{
  return _[a1 drawing];
}